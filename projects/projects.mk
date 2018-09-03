# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)

# Local variables

# Local rules and targets


# Subdirectories, in random order. Directory-specific rules are optional here.
dir:=$(d)/p1
include	$(dir)/p1.mk
dir:=$(d)/p2
include	$(dir)/p2.mk

# Standard things

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))
