# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)

# Subdirectories, in random order. Directory-specific rules are optional here.
dir:=$(d)/chip
include	$(dir)/chip.mk

# Standard things

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))
