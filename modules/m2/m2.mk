# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)

$(shell mkdir -p $(DIR_OBJ)/$(d)/)
# Local variables
SRCLIST_$(d) := m2.c \

INCLIST_$(d) := -I$(d)/inc

SRCS_$(d) := $(addprefix $(d)/src/, $(SRCLIST_$(d)))
OBJS_$(d) := $(addprefix $(DIR_OBJ)/$(d)/, $(SRCLIST_$(d):%.c=%.o))
DEPS_$(d) := $(OBJS_$(d):%=%.d)
#CLEAN := $(CLEAN) $(OBJS_$(d)) $(DEPS_$(d))
# Local rules and targets

TGT_MD := $(TGT_MD) $(OBJS_$(d)) $(M2_LIB)
$(OBJS_$(d)): CF_TGT := $(INCLIST_$(d))
$(OBJS_$(d)): $(SRCS_$(d))
	@echo "m2 make>>"
	$(COMP)

$(M2_LIB): $(OBJS_$(d))
	@echo ">> create M2 lib"
	$(ARCH)
# Subdirectories, in random order. Directory-specific rules are optional here.
dir:=$(d)/test
include	$(dir)/test.mk

# Standard things

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))