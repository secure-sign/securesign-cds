# expects to be run by toplevel Makefile

srcdir = src
includedir = ../include
builddir = ../build

CFLAGS := -m64 -O2 -ggdb -pipe -fPIC \
	  -std=c11 -D_DEFAULT_SOURCE \
	  -Wall -Werror=all -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-attributes \
	  -I$(includedir) -I../$(SGX_INCLUDEDIR) -I$(JDK_HOME)/include -I$(JDK_HOME)/include/linux

TARGET := $(builddir)/libsabd-jni.so

SOURCES := $(srcdir)/sgxsd-jni.c $(srcdir)/sgxsd.c $(srcdir)/sabd_enclave_u.c
OBJECTS := $(addprefix $(builddir)/,$(SOURCES:.c=.o))
LDFLAGS := $(CFLAGS) -L../$(SGX_LIBDIR) -lsgx_urts

.PHONY: all
all: $(TARGET)

$(OBJECTS): $(builddir)/%.o: %.c $(includedir)/sgxsd.h $(includedir)/sabd.h
	@mkdir -p $(dir $@)
	$(CC) -o $@ $(CFLAGS) -c $<

$(TARGET): $(OBJECTS)
	$(CC) -shared -Wl,-soname=$@ -Wl,--whole-archive $^ -Wl,--no-whole-archive -o $@ $(LDFLAGS)

.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJECTS)
