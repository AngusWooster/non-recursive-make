### Installation paths and compiled-in defaults
#
DIR_OUTPUT = output
DIR_OBJ = $(DIR_OUTPUT)/obj
DIR_LIB = $(DIR_OUTPUT)/lib
DIR_TEST = $(DIR_OUTPUT)/test
DIRS = $(DIR_OBJ) $(DIR_LIB) $(DIR_TEST)

### Modules that will be built and installed
#TGT_LIB 	+= modules/radldap/radldap

### Target that will be built
TGT_UT = $(DIR_TEST)/ut_all

### System compatibility flags, used in some targets' CF_TGT, LF_TGT or LL_TGT
#
S_CF_UT	= -DUNIT_TEST -Imodules/ut/inc


### Build flags for all targets
#
#CF_ALL		= -O2 -Wall
#LF_ALL		= -s
#LL_ALL		=
CF_ALL		= -g -Wall
LF_ALL		=
LL_ALL		=

### Module-specific build flags
#
#CF_RADLDAP	= -I/usr/local/include/openldap
#LF_RADLDAP	= -L/usr/local/lib
#LL_RADLDAP	= -lldap


### Build tools
# 
# The C compiler named here must output full (header) dependencies in $(@).d.
# It may be necessary to create a script similar to ccd-gcc for your compiler.
# 
CMPLR		= ./build/ccd-gcc
DEFHDR		= ./build/hdr
INST		= ./build/install
ARCH		= ar rc $@ $^			# "r": create a static lib ,"c": add *.o 
#
COMP		= $(CMPLR) $(CF_ALL) $(CF_TGT) -o $@ -c $<
LINK		= $(CMPLR) $(LF_ALL) $(LF_TGT) -o $@ $^ $(LL_TGT) $(LL_ALL)
COMPLINK	= $(CMPLR) $(CF_ALL) $(CF_TGT) $(LF_ALL) $(LF_TGT) -o $@ $< $(LL_TGT) $(LL_ALL)

### Standard parts
#
include	setting.mk
include	Rules.mk

