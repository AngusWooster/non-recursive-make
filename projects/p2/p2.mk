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

SRCS_$(d) := $(addprefix $(d)/src/, $(SRCLIST_$(d)))
OBJS_$(d) := $(addprefix $(d)/src/, $(SRCLIST_$(d):%.c=%.o))
DEPS_$(d) := $(OBJS_$(d):%=%.d)
CLEAN := $(CLEAN) $(target) $(OBJS_$(d)) $(DEPS_$(d))
# Local rules and targets
TGT_P2 := $(target)

$(OBJS_$(d)): CF_TGT := $(INCLIST_$(d))	## Add header folders	

$(target) : CF_TGT := $(INCLIST_$(d))				## Add header folders
$(target) : LL_TGT := $(M1_LIB)						## Add links OBJS / Libs
$(target) : $(OBJS_$(d))							## Add dependency files
	@echo "p2 LINK>>"
	$(LINK)


# Subdirectories, in random order. Directory-specific rules are optional here.


# Standard things

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))