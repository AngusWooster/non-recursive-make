# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)


# Local variables
UT_LIBS = $(DIR_LIB)/libut.a
SRCLIST_$(d) := ut_all.c

INCLIST_$(d) := -I$(d)/inc

SRCS_$(d) := $(addprefix $(d)/src/, $(SRCLIST_$(d)))
OBJS_$(d) := $(SRCS_$(d):%.c=$(DIR_OBJ)/%.o)
DEPS_$(d) := $(OBJS_$(d):%=%.d)
# Local rules and targets
$(UT_LIBS): $(ALL_UT_TEST_OBJS) $(ALL_MODULES_OBJS)


$(DIR_TEST)/ut_all: CF_TGT := $(INCLIST_$(d)) $(S_CF_UT)#	Add header folders/ Defines
$(DIR_TEST)/ut_all: LL_TGT := $(UT_LIBS)# Add links Libs
$(DIR_TEST)/ut_all:  $(SRCS_$(d)) $(UT_LIBS)# Add dependency files
		@echo ">> CF_TGT = "$(CF_TGT)
		@echo ">> LL_TGT = " $(LL_TGT)
		$(COMPLINK)
# Standard things

-include	$(DEPS_$(d))

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))