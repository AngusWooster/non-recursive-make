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
dir:=modules
include	$(dir)/modules.mk


# General directory independent rules

%.o:		%.c
		$(COMP)

%:		%.o
		$(LINK)

%:		%.c
		$(COMPLINK)


# These two targets collect real targets, i.e. ones that can be built.

.PHONY:		targets
targets:	$(TGT_BIN) $(TGT_SBIN) $(TGT_ETC) $(TGT_LIB)

.PHONY:		testprogs
testprogs:	$(TGT_TEST)

.PHONY:		ut
ut:	$(TGT_UT)
	$(TGT_UT)
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

