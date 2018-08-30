# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)


# Local variables
SRCLIST_$(d) := m2_test.c
INCLIST_$(d) := -I$(d)/inc

SRCS_$(d) := $(addprefix $(d)/, $(SRCLIST_$(d)))
OBJS_$(d) := $(addprefix $(d)/, $(SRCLIST_$(d):%.c=%.o))
DEPS_$(d) := $(OBJS_$(d):%=%.d)
CLEAN := $(CLEAN) $(OBJS_$(d)) $(DEPS_$(d))
# Local rules and targets
$(OBJS_$(d)):	CF_TGT := -I$(d)
$(OBJS_$(d)):	$(SRCS_$(d))
		@echo ">> m2_test qqqqq"
		$(COMP)

OBJS_ALL_UT_TEST:= $(OBJS_ALL_UT_TEST) $(OBJS_$(d))

# Standard things

-include	$(DEPS_$(d))


d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))