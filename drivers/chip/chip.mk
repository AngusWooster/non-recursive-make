# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)

$(shell mkdir -p $(DIR_OBJ)/$(d)/i2c)
# Local variables
SRCLIST_$(d) := i2c/hal_i2c.c \

INCLIST_$(d) := -I$(d)/inc -I$(d)/i2c

SRCS_$(d) := $(addprefix $(d)/, $(SRCLIST_$(d)))
OBJS_$(d) := $(SRCS_$(d):%.c=$(DIR_OBJ)/%.o)
DEPS_$(d) := $(OBJS_$(d):%=%.d)
CLEAN := $(CLEAN) $(OBJS_$(d)) $(DEPS_$(d))
# Local rules and targets
TGT_DRIVERS := $(OBJS_$(d))
$(OBJS_$(d)): CF_TGT := $(INCLIST_$(d))

# Subdirectories, in random order. Directory-specific rules are optional here.

# Standard things

-include	$(DEPS_$(d))

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))