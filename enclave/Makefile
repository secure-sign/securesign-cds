srcdir = src
includedir = include
builddir = build
resourcedir = ../service/src/main/resources

JDK_HOME ?= $(dir $(word 1,$(wildcard /usr/lib/jvm/*/include)))
export JDK_HOME

DOCKER ?= docker
INSTALL ?= install

INSTALL_PROGRAM = $(INSTALL) -m 755 $(INSTALL_PROGRAM_FLAGS)
INSTALL_DATA    = $(INSTALL) -m 644

DESTDIR ?=

CFLAGS = \
	-m64 -O2 -ggdb -march=skylake -pipe -fPIC \
	-std=c11 -D_DEFAULT_SOURCE \
	-fstack-protector \
	-Wall -Werror=all -Wextra -Wno-unused-parameter -Wno-missing-field-initializers \
	-I$(includedir) -I$(includedir)/bearssl -I$(SGX_INCLUDEDIR)

LDFLAGS =

TEST_CFLAGS += $(CFLAGS) \
	-DUNIT_TESTING -fsanitize=address -static-libasan -fsanitize=undefined

ENCLAVE_NAME		:= libsabd_enclave
TARGET			:= $(builddir)/$(ENCLAVE_NAME).unsigned.so
UNSTRIPPED_TARGET	:= $(builddir)/$(ENCLAVE_NAME).unstripped.so

SIGNDATA		:= $(builddir)/$(ENCLAVE_NAME).signdata
MRENCLAVE		:= $(builddir)/$(ENCLAVE_NAME).mrenclave
SIGNED_TARGET		:= $(builddir)/$(ENCLAVE_NAME).signed.so
ENCLAVE_CONFIG		:= $(ENCLAVE_NAME).config.xml

DEBUG_ENCLAVE_NAME	:= $(ENCLAVE_NAME).debug
DEBUG_SIGNDATA		:= $(builddir)/$(DEBUG_ENCLAVE_NAME).signdata
DEBUG_SIGNED_TARGET	:= $(builddir)/$(DEBUG_ENCLAVE_NAME).so
DEBUG_ENCLAVE_CONFIG	:= $(DEBUG_ENCLAVE_NAME).config.xml

TEST_SABD_TARGET	:= $(builddir)/sabd-enclave-test
TEST_SGXSD_TARGET	:= $(builddir)/sgxsd-enclave-test

BEARSSL_SOURCES := \
	   $(srcdir)/bearssl/gcm.c $(srcdir)/bearssl/ghash_pclmul.c \
	   $(srcdir)/bearssl/sha2small.c $(srcdir)/bearssl/dec32be.c $(srcdir)/bearssl/enc32be.c \
	   $(srcdir)/bearssl/aes_x86ni_ctr.c $(srcdir)/bearssl/aes_x86ni.c
BEARSSL_OBJECTS := $(BEARSSL_SOURCES:.c=.o)

SOURCES := $(srcdir)/sabd-enclave.c.s $(srcdir)/sgxsd-enclave.c $(srcdir)/curve25519-donna-c64.c $(BEARSSL_SOURCES) \
	   $(srcdir)/sgx-tcrypto-stub.c
OBJECTS := $(addprefix $(builddir)/,$(patsubst %.s,%.o,$(SOURCES:.c=.o)))

TEST_SABD_SOURCES := $(srcdir)/sabd-enclave.c $(srcdir)/sabd-enclave-test.c $(srcdir)/cmockery.c
TEST_SABD_OBJECTS := $(addprefix $(builddir)/test/,$(TEST_SABD_SOURCES:.c=.o))

TEST_SGXSD_SOURCES := $(srcdir)/sgxsd-enclave.c $(srcdir)/curve25519-donna-c64.c $(srcdir)/sgxsd-enclave-test.c $(srcdir)/cmockery.c
TEST_SGXSD_OBJECTS := $(addprefix $(builddir)/test/,$(TEST_SGXSD_SOURCES:.c=.o))

TEST_LDFLAGS += $(TEST_CFLAGS)

.PHONY: default docker-install all test benchmark debug sign install edger8r clean jni docker

.SUFFIXES:
.SUFFIXES: .s .c .o

default: docker-install

docker-install: docker install

all: $(srcdir)/sabd-enclave.c.s $(UNSTRIPPED_TARGET) $(TARGET) $(DEBUG_SIGNED_TARGET) $(SIGNDATA) $(MRENCLAVE) jni

test: $(TEST_SABD_TARGET) $(TEST_SGXSD_TARGET)
	./$(TEST_SABD_TARGET)
	./$(TEST_SGXSD_TARGET)

benchmark: $(TEST_SABD_TARGET)
	./$(TEST_SABD_TARGET) --benchmark

debug: $(TARGET) $(DEBUG_SIGNED_TARGET)

sign: $(SIGNED_TARGET)

install:
	$(INSTALL_DATA) $(DEBUG_SIGNED_TARGET)     $(resourcedir)/enclave/$$(cat $(MRENCLAVE)).so
	$(INSTALL_DATA) $(builddir)/libsabd-jni.so $(resourcedir)/enclave-jni.so
	$(INSTALL_DATA) $(SIGNDATA)                signdata/$$(cat $(MRENCLAVE)).signdata
	if [ -e $(SIGNED_TARGET) ]; then \
		$(INSTALL_DATA) $(SIGNED_TARGET) $(resourcedir)/enclave/$$(cat $(MRENCLAVE)).so; \
	fi


edger8r: $(includedir)/sabd_enclave.edl | $(SGX_EDGER8R)
	 $(SGX_EDGER8R) --untrusted --untrusted-dir jni/src \
			--trusted --trusted-dir $(srcdir) \
			--search-path $(SGX_INCLUDEDIR) \
			$(includedir)/sabd_enclave.edl

clean:
	rm -f	$(TARGET) $(UNSTRIPPED_TARGET) \
		$(SIGNDATA) $(MRENCLAVE) $(SIGNED_TARGET) \
		$(DEBUG_ENCLAVE_NAME).key $(DEBUG_ENCLAVE_NAME).pub $(DEBUG_ENCLAVE_NAME).sig \
		$(DEBUG_SIGNDATA) $(DEBUG_SIGNED_TARGET) \
		$(OBJECTS) $(builddir)/sabd_enclave_t.o $(builddir)/libsgx_*.a $(builddir)/libselib.a \
		$(TEST_SABD_TARGET) $(TEST_SABD_OBJECTS) $(TEST_SGXSD_TARGET) $(TEST_SGXSD_OBJECTS)
	-make -C jni clean
	-$(SGX_SDK_MAKE) -C $(SGX_SDK_SOURCE_DIR) clean

include sgx_enclave.mk

## sabd

%.c.s: %.c
	$(CC) -o $@ $(CFLAGS) $(ENCLAVE_CFLAGS) -S -ggdb0 -fverbose-asm $<

$(BEARSSL_OBJECTS): $(wildcard $(includedir)/bearssl/%.h)
$(filter %.c.o,$(OBJECTS)): $(builddir)/%.c.o: %.c.s | $(SGX_INCLUDEDIR)
	@mkdir -p $(dir $@)
	$(CC) -o $@ $(CFLAGS) $(ENCLAVE_CFLAGS) -c $<
$(filter-out %c.o,$(OBJECTS)): $(builddir)/%.o: %.c $(includedir)/sgxsd.h $(includedir)/sgxsd-enclave.h $(includedir)/sabd.h $(includedir)/sabd-enclave.h | $(SGX_INCLUDEDIR)
	@mkdir -p $(dir $@)
	$(CC) -o $@ $(CFLAGS) $(ENCLAVE_CFLAGS) -c $<

$(builddir)/sabd_enclave_t.o: $(includedir)/sabd_enclave_t.c
	$(CC) -o $@ $(CFLAGS) $(ENCLAVE_CFLAGS) -c $<

$(filter-out %c.o,$(TEST_SGXSD_OBJECTS) $(TEST_SABD_OBJECTS)): $(builddir)/test/%.o: %.c $(includedir)/sgxsd.h $(includedir)/sgxsd-enclave.h $(includedir)/sabd.h $(includedir)/sabd-enclave.h $(includedir)/cmockery.h
	@mkdir -p $(dir $@)
	$(CC) -o $@ $(CFLAGS) $(TEST_CFLAGS) -c $<

$(TEST_SGXSD_TARGET): $(TEST_SGXSD_OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $(LDLIBS) $(filter %.o,$^) $(TEST_LDFLAGS)

$(TEST_SABD_TARGET): $(TEST_SABD_OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $(filter %.o,$^) $(TEST_LDFLAGS)

$(UNSTRIPPED_TARGET): $(OBJECTS)

## JNI

jni: $(SGX_LIBDIR)/libsgx_urts.so
	$(MAKE) -C jni

## Reproducible enclave build via debian package

MAKETARGET ?= debuild debrebuild jni sign

docker: DOCKER_EXTRA=$(shell [ -L build ] && P=$$(readlink build) && echo -v $$P/:$$P )
docker:
	$(DOCKER) build --build-arg UID=$$(id -u) --build-arg GID=$$(id -g) \
		-t contactdiscovery-enclave-builder ./docker
	$(DOCKER) run -it --rm --user $$(id -u):$$(id -g) --cap-add SYS_PTRACE \
		-v `pwd`/:/home/signal/src $(DOCKER_EXTRA) contactdiscovery-enclave-builder \
		sh -c "cd src; make $(MAKETARGET)"

.PHONY: debuild
debuild:
	env -u LANG LC_ALL=C debuild --preserve-envvar=PATH --no-lintian --build=binary -uc -us -j1
	mv ../*.buildinfo debian/buildinfo
	mv ../*.deb debian/

.PHONY: debrebuild
debrebuild: docker/debrebuild.pl
	-@if perl docker/debrebuild.pl debian/buildinfo docker; then \
		echo; echo Updated docker/build-deps, docker/sources.list, and debian/buildinfo. Please check them in if modified.; \
	else \
		echo; echo Failed to update docker/build-deps and docker/sources.list from debian/buildinfo. Continuing build anyway...; \
	fi

.PHONY: debuild-enclave-build
debuild-enclave-build: all

.PHONY: debuild-enclave-install
debuild-enclave-install: $(TARGET)
	mkdir -p $(DESTDIR)/usr/lib/sabd/enclave/
	$(INSTALL_DATA) $(TARGET) $(DESTDIR)/usr/lib/sabd/enclave/
