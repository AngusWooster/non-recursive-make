# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)

$(shell mkdir -p $(DIR_OBJ)/$(d)/)
# Local variables
SRCLIST_$(d) := m2.c \

INCLIST_$(d) := -I$(d)/inc

SRCS_$(d) := $(addprefix $(d)/src/, $(SRCLIST_$(d)))
OBJS_$(d) := $(SRCS_$(d):%.c=$(DIR_OBJ)/%.o)
DEPS_$(d) := $(OBJS_$(d):%=%.d)
CLEAN := $(CLEAN) $(OBJS_$(d)) $(DEPS_$(d))
# Local rules and targets
TGT_MD := $(TGT_MD) $(M2_LIB)
$(M2_LIB): $(OBJS_$(d))
$(OBJS_$(d)): CF_TGT := $(INCLIST_$(d))

ALL_MODULES_OBJS := $(ALL_MODULES_OBJS) $(OBJS_$(d))
# Subdirectories, in random order. Directory-specific rules are optional here.
dir:=$(d)/test
include	$(dir)/test.mk

# Standard things

-include	$(DEPS_$(d))

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))