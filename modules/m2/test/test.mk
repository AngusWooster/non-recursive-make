# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)


# Local variables
SRCLIST_$(d) := m2_test.c

INCLIST_$(d) := -I$(d)/inc

SRCS_$(d) := $(addprefix $(d)/, $(SRCLIST_$(d)))
OBJS_$(d) := $(SRCS_$(d):%.c=$(DIR_OBJ)/%.o)
DEPS_$(d) := $(OBJS_$(d):%=%.d)
CLEAN := $(CLEAN) $(OBJS_$(d)) $(DEPS_$(d))
# Local rules and targets
ALL_UT_TEST_OBJS:= $(ALL_UT_TEST_OBJS) $(OBJS_$(d))
$(OBJS_$(d)) : CF_TGT := $(INCLIST_$(d)) $(S_CF_UT) -I$(dirstack_$(sp))/inc

# Standard things

#-include	$(DEPS_$(d))


d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))