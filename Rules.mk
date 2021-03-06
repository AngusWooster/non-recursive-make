# Note: this design uses target-specific flags, because it's the only
# way to get the value of a variable that's different for each
# subdirectory, $(d), into the build recipes. Once you go that way,
# you can as well use the feature to specify (extra) objects and 
# libraries to be linked or archived.


# Create all build directories
$(shell mkdir -p $(DIRS))

# Standard stuff

VERSION		:= pre0.9.5

.SUFFIXES:
.SUFFIXES:	.c .o

all:		targets


# Subdirectories, in random order
dir:=drivers
include	$(dir)/drivers.mk
dir:=modules
include	$(dir)/modules.mk
dir:=projects
include	$(dir)/projects.mk

# General directory independent rules
$(DIR_OBJ)/%.o:	%.c
	@echo "comp1"
#$(CMPLR) $(CF_ALL) $(CF_TGT) -o $(DIR_OBJ)/$(@F) -c $<
	$(COMP)
%.a:
#ar rc $@ $(addprefix  $(DIR_OBJ)/, $(^F))
	$(ARCH)


#%.o:	%.c
#		$(COMP)
#
#%:		%.o
#		$(LINK)
#
#%:		%.c
#		$(COMPLINK)
#
%.a:
		$(ARCH)
# These two targets collect real targets, i.e. ones that can be built.

.PHONY:		targets
targets:	p1

.PHONY:		p1
p1:	$(TGT_P1)
$(TGT_P1) : $(TGT_MD)
$(TGT_MD) : $(TGT_DRIVERS)

.PHONY:		p2
p2:	$(TGT_P2)
$(TGT_P2) : $(TGT_MD)
$(TGT_MD) : $(TGT_DRIVERS)

.PHONY:		ut
ut:	$(TGT_UT)
	$(TGT_UT)

# make modules
.PHONY:		md
md: $(TGT_MD)

# make drivers
.PHONY:		drivers
drivers: $(TGT_DRIVERS)
# These targets merely contain commands to be executed, i.e. they collect
# only .PHONY targets, even if they're not explicitly marked as such. 
# The install target does not collect dependencies (other than for forcing
# things to be built) because it's always considered 'out of date' anway as
# it's a .PHONY target. Instead, it collects installation commands that will be
# ran in addition to the standard ones to install the known targets.

.PHONY:		clean
clean:
		rm -f $(CLEAN)
		rm -rf $(DIR_OUTPUT)

# Prevent make from removing any build targets, including intermediate ones

.SECONDARY:	$(CLEAN)

