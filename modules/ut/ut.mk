# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)


# Local variables
UT_LIBS = $(DIR_LIB)/libut.a
SRCLIST_$(d) := ut_all.c
INCLIST_$(d) := -I$(d)/inc

SRCS_$(d) := $(addprefix $(d)/src/, $(SRCLIST_$(d)))
OBJS_$(d) := $(addprefix $(DIR_OBJ)/$(d)/, $(SRCLIST_$(d):%.c=%.o))
DEPS_$(d)	:= $(OBJS_$(d):%=%.d)

# Local rules and targets
$(OBJS_$(d)):	CF_TGT := -I$(d) $(INCLIST_$(d))
$(OBJS_$(d)):	$(SRCS_$(d))
	@echo ">> ut.mk"
	$(COMP)

$(UT_LIBS): $(OBJS_ALL_UT_TEST)
	@echo ">> create ut lib"
	$(ARCH)

$(DIR_TEST)/ut_all: CF_TGT := $(INCLIST_$(d)) $(S_CF_UT)				## Add header folders
$(DIR_TEST)/ut_all: LL_TGT := $(UT_LIBS)#$(OBJS_ALL_UT_TEST)			## Add links OBJS / Libs
$(DIR_TEST)/ut_all:  $(SRCS_$(d)) $(UT_LIBS) #$(OBJS_ALL_UT_TEST)		## Add dependency files
		@echo ">> CF_TGT = "$(CF_TGT)
		@echo ">> LL_TGT = " $(LL_TGT)
		$(COMPLINK)

# Standard things

#-include	$(DEPS_$(d))

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))