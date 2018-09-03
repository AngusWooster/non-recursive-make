# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)

# Local variables

# Local rules and targets


# Subdirectories, in random order. Directory-specific rules are optional here.
dir:=$(d)/m1
include	$(dir)/m1.mk
dir:=$(d)/m2
include	$(dir)/m2.mk
dir:=$(d)/ut
include	$(dir)/ut.mk


# Standard things

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))
