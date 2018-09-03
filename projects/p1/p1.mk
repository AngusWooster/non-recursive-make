# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)

#$(shell mkdir -p $(DIR_OBJ)/$(d)/)
# Local variables
target := $(d)/exe
SRCLIST_$(d) := main.c \

INCLIST_$(d) := -I$(d)/inc \
				-Imodules/m1/inc \
				-Imodules/m2/inc \

SRCS_$(d) := $(addprefix $(d)/src/, $(SRCLIST_$(d)))
#OBJS_$(d) := $(addprefix $(d)/, $(SRCLIST_$(d):%.c=%.o))
#DEPS_$(d) := $(OBJS_$(d):%=%.d)
CLEAN := $(CLEAN) $(target) $(target).d #$(OBJS_$(d)) $(DEPS_$(d))
# Local rules and targets
TGT_P1 := $(target)
$(target) : CF_TGT := $(INCLIST_$(d))				## Add header folders
$(target) : LL_TGT := $(M1_LIB) $(M2_LIB)			## Add links OBJS / Libs
$(target) : $(SRCS_$(d))							## Add dependency files
	@echo "p1 make>>"
	$(COMPLINK)


# Subdirectories, in random order. Directory-specific rules are optional here.


# Standard things

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))