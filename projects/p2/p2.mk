# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)

$(shell mkdir -p $(DIR_OBJ)/$(d)/src/)
# Local variables
target := $(DIR_OUTPUT)/p2
SRCLIST_$(d) := main.c \

INCLIST_$(d) := -I$(d)/inc \
				-Imodules/m1/inc \

SRCS_$(d) := $(addprefix $(d)/src/, $(SRCLIST_$(d)))
OBJS_$(d) := $(SRCS_$(d):%.c=$(DIR_OBJ)/%.o)
DEPS_$(d) := $(OBJS_$(d):%=%.d)
CLEAN := $(CLEAN) $(target) $(OBJS_$(d)) $(DEPS_$(d))
# Local rules and targets
TGT_P2 := $(target)

$(OBJS_$(d)): CF_TGT := $(INCLIST_$(d))	## Add header folders	

$(target) : CF_TGT := $(INCLIST_$(d))## Add header folders
$(target) : LL_TGT := $(M1_LIB)## Add links OBJS / Libs
$(target) : $(OBJS_$(d))## Add dependency files
	@echo "p2 LINK>>"
	$(LINK)


# Subdirectories, in random order. Directory-specific rules are optional here.


# Standard things

-include	$(DEPS_$(d))

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))