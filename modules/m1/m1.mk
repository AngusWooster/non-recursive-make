# Standard things

sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)


# Local rules and targets



# Subdirectories, in random order. Directory-specific rules are optional here.
dir:=$(d)/test
include	$(dir)/test.mk

# Standard things


d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))