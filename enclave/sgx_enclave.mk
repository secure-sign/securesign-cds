SGX_MODE ?= HW
export SGX_MODE
USE_OPT_LIBS ?= 0
export USE_OPT_LIBS

##
## linux sdk
##

SGX_SDK_SOURCE_GIT_TAG  ?= sgx_2.6
SGX_SDK_SOURCE_GIT_REV  ?= sgx_2.6-g991bd53a76a5
SGX_DCAP_SOURCE_GIT_TAG ?= DCAP_1.2
SGX_DCAP_SOURCE_GIT_REV ?= DCAP_1.2-g2c236e7600c5

export SGX_SDK_SOURCE_DIR = $(builddir)/linux-sgx-$(SGX_SDK_SOURCE_GIT_REV)
export SGX_SDK_SOURCE_INCLUDEDIR = $(SGX_SDK_SOURCE_DIR)/common/inc
export SGX_SDK_SOURCE_LIBDIR = $(SGX_SDK_SOURCE_DIR)/build/linux

SGX_SDK_SOURCE_DIRS = $(SGX_SDK_SOURCE_DIR) $(SGX_SDK_SOURCE_DIR)/external/dcap_source

ifneq ($(SGX_SDK_DIR),)
SGX_LIBDIR = $(SGX_SDK_DIR)/lib64
SGX_INCLUDEDIR = $(SGX_SDK_DIR)/include
endif

SGX_INCLUDEDIR ?= $(SGX_SDK_SOURCE_INCLUDEDIR)
export SGX_INCLUDEDIR
SGX_LIBDIR ?= $(SGX_SDK_SOURCE_LIBDIR)
export SGX_LIBDIR
SGX_SIGN ?= $(SGX_SDK_SOURCE_LIBDIR)/sgx_sign
SGX_EDGER8R ?= $(SGX_SDK_SOURCE_LIBDIR)/sgx_edger8r
SGX_SDK_MAKE = env -u CFLAGS -u LDFLAGS -u CPPFLAGS $(MAKE)

$(SGX_SDK_SOURCE_INCLUDEDIR): | $(SGX_SDK_SOURCE_DIRS)

$(SGX_SDK_SOURCE_LIBDIR)/libsgx_trts_sim.a: | $(SGX_SDK_SOURCE_DIRS)
	$(SGX_SDK_MAKE) -C $(SGX_SDK_SOURCE_DIR)/sdk simulation
$(SGX_SDK_SOURCE_LIBDIR)/libsgx_%.a: | $(SGX_SDK_SOURCE_DIRS)
	$(SGX_SDK_MAKE) -C $(SGX_SDK_SOURCE_DIR)/sdk $*
$(SGX_SDK_SOURCE_DIR)/sdk/selib/linux/libselib.a: | $(SGX_SDK_SOURCE_DIRS)
	$(SGX_SDK_MAKE) -C $(SGX_SDK_SOURCE_DIR)/sdk selib
$(SGX_SDK_SOURCE_LIBDIR)/libsgx_urts_sim.so: | $(SGX_SDK_SOURCE_DIRS)
	$(SGX_SDK_MAKE) -C $(SGX_SDK_SOURCE_DIR)/psw simulation
$(SGX_SDK_SOURCE_LIBDIR)/libsgx_%.so: | $(SGX_SDK_SOURCE_DIRS)
	$(SGX_SDK_MAKE) -C $(SGX_SDK_SOURCE_DIR)/psw $*
$(SGX_SDK_SOURCE_LIBDIR)/sgx_sign: | $(SGX_SDK_SOURCE_DIRS)
	$(SGX_SDK_MAKE) -C $(SGX_SDK_SOURCE_DIR)/sdk signtool
$(SGX_SDK_SOURCE_LIBDIR)/sgx_edger8r: | $(SGX_SDK_SOURCE_DIRS)
	$(SGX_SDK_MAKE) -C $(SGX_SDK_SOURCE_DIR)/sdk edger8r

$(builddir)/libsgx_%.a: $(SGX_LIBDIR)/libsgx_%.a
	ar mD $< $$(ar t $< | env -u LANG LC_ALL=C sort)
	cp $< $@
$(builddir)/libsgx_%.so: $(SGX_LIBDIR)/libsgx_%.so
	cp $< $@ #XXX Need to sort the symbols for reproducability.
$(builddir)/libselib.a: $(SGX_SDK_SOURCE_DIR)/sdk/selib/linux/libselib.a
	ar mD $< $$(ar t $< | env -u LANG LC_ALL=C sort)
	cp $< $@

$(builddir)/linux-sgx-%.git:
	@mkdir -p $(dir $@)
	git clone --depth 1 --branch $* --bare https://github.com/01org/linux-sgx.git $@
$(builddir)/dcap_source-%.git:
	@mkdir -p $(dir $@)
	git clone --depth 1 --branch $* --bare https://github.com/intel/SGXDataCenterAttestationPrimitives.git $@
$(builddir)/linux-sgx-$(SGX_SDK_SOURCE_GIT_REV): $(builddir)/linux-sgx-$(SGX_SDK_SOURCE_GIT_TAG).git
	@mkdir -p $(dir $@)
	git --git-dir=$< fetch origin master
	git --git-dir=$< archive --prefix=$@/ $(SGX_SDK_SOURCE_GIT_REV) | tar -x --exclude=$@/external/dcap_source

$(builddir)/linux-sgx-$(SGX_SDK_SOURCE_GIT_REV)/external/dcap_source: $(builddir)/dcap_source-$(SGX_DCAP_SOURCE_GIT_TAG).git
	git --git-dir=$< archive --prefix=$@/ $(SGX_DCAP_SOURCE_GIT_REV) | tar -x

##
## edger8r
##

%_t.c: %.edl %_t.h | $(SGX_EDGER8R)
	mv $*_t.h $*_t.h.bak
	 $(SGX_EDGER8R) --trusted --trusted-dir $(dir $@) --search-path $(SGX_INCLUDEDIR) --search-path $(includedir) $<; RES=$$?; mv $*_t.h.bak $*_t.h; exit $$RES
%_t.h: %.edl | $(SGX_EDGER8R)
	 $(SGX_EDGER8R) --trusted --trusted-dir $(dir $@) --search-path $(SGX_INCLUDEDIR) --search-path $(includedir) --header-only $<

%_u.c: %.edl %_u.h | $(SGX_EDGER8R)
	mv $*_u.h $*_u.h.bak
	$(SGX_EDGER8R) --untrusted --untrusted-dir $(dir $@) --search-path $(SGX_INCLUDEDIR) --search-path $(includedir) $<; RES=$$?; mv $*_u.h.bak $*_u.h; exit $$RES
%_u.h: %.edl | $(SGX_EDGER8R)
	 $(SGX_EDGER8R) --untrusted --untrusted-dir $(dir $@) --search-path $(SGX_INCLUDEDIR) --search-path $(includedir) --header-only $<

##
## linking
##

ENCLAVE_CFLAGS = -fvisibility=hidden -fPIC -I$(SGX_INCLUDEDIR)/tlibc -fno-builtin -ffreestanding

ENCLAVE_LDFLAGS = -Wl,--no-undefined -nostdlib -nodefaultlibs -nostartfiles -L$(builddir) \
	-Wl,--whole-archive -lsgx_trts -Wl,--no-whole-archive \
	-Wl,--start-group -lsgx_tstdc -lselib -Wl,--end-group \
	-Wl,-Bstatic -Wl,-Bsymbolic -Wl,--no-allow-shlib-undefined \
	-Wl,-eenclave_entry -Wl,--export-dynamic -Wl,--build-id=none \
	-Wl,--defsym,__ImageBase=0

$(builddir)/lib%.unstripped.so: CFLAGS += $(ENCLAVE_CFLAGS)
$(builddir)/lib%.unstripped.so: $(builddir)/%_t.o $(builddir)/libsgx_trts.a $(builddir)/libselib.a $(builddir)/libsgx_tstdc.a
	$(CC) $(LDFLAGS) -o $@ $(filter %.o,$^) $(LDLIBS) \
		$(ENCLAVE_LDFLAGS) -Wl,--version-script=lib$*.lds -Wl,-soname,lib$*.so
$(builddir)/%.unsigned.so: $(builddir)/%.unstripped.so
	strip --strip-all $< -o $@

##
## signing
##

%.debug.key:
	openssl genrsa -out $@ -3 3072
%.pub: %.key
	openssl rsa -out $@ -in $< -pubout

%.debug.config.xml: %.config.xml
	sed -e 's@<DisableDebug>1</DisableDebug>@<DisableDebug>0</DisableDebug>@' $< > $@
$(builddir)/%.debug.signdata: $(builddir)/%.unsigned.so %.debug.config.xml | $(SGX_SIGN)
	$(SGX_SIGN) gendata -out $@ -enclave $(builddir)/$*.unsigned.so -config $*.debug.config.xml
$(builddir)/%.debug.so: $(builddir)/%.unsigned.so $(builddir)/%.debug.signdata %.debug.config.xml %.debug.pub $(builddir)/%.debug.sig | $(SGX_SIGN)
	$(SGX_SIGN) catsig \
		-out $@ \
		-enclave $(builddir)/$*.unsigned.so \
		-unsigned $(builddir)/$*.debug.signdata \
		-config $*.debug.config.xml \
		-key $*.debug.pub \
		-sig $(builddir)/$*.debug.sig

$(builddir)/%.signdata: $(builddir)/%.unsigned.so %.config.xml | $(SGX_SIGN)
	$(SGX_SIGN) gendata -out $@ -enclave $(builddir)/$*.unsigned.so -config $*.config.xml
$(builddir)/%.mrenclave: $(builddir)/%.signdata
	perl -e 'undef $$/; print unpack("x188 H64", <>);' $< > $@
	@echo mrenclave: $$(cat $@)
$(builddir)/%.sig: $(builddir)/%.signdata %.key
	openssl dgst -sha256 -out $@ -sign $*.key $(builddir)/$*.signdata
$(builddir)/%.signed.so: $(builddir)/%.unsigned.so $(builddir)/%.signdata %.config.xml %.pub $(builddir)/%.sig | $(SGX_SIGN)
	$(SGX_SIGN) catsig \
		-out $@ \
		-enclave $(builddir)/$*.unsigned.so \
		-unsigned $(builddir)/$*.signdata \
		-config $*.config.xml \
		-key $*.pub \
		-sig $(builddir)/$*.sig
