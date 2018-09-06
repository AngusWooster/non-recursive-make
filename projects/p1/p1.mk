# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)

#$(shell mkdir -p $(DIR_OBJ)/$(d)/)
# Local variables
target := $(d)/exe
SRCLIST_$(d) := main.c \
				p1_a.c \

INCLIST_$(d) := -I$(d)/inc \
				-Imodules/m1/inc \
				-Imodules/m2/inc \

SRCS_$(d) := $(addprefix $(d)/src/, $(SRCLIST_$(d)))
OBJS_$(d) := $(addprefix $(d)/src/, $(SRCLIST_$(d):%.c=%.o))
DEPS_$(d) := $(OBJS_$(d):%=%.d)
CLEAN := $(CLEAN) $(target) $(OBJS_$(d)) $(DEPS_$(d))
# Local rules and targets
TGT_P1 := $(target)

$(OBJS_$(d)): CF_TGT := $(INCLIST_$(d))	## Add header folders	

		
$(target) : LL_TGT := $(M1_LIB) $(M2_LIB)			## Add links OBJS / Libs
$(target) : $(OBJS_$(d))	 						## Add dependency files
	@echo "p1 COMPLINK>>"
	$(LINK)
# Subdirectories, in random order. Directory-specific rules are optional here.


# Standard things

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))