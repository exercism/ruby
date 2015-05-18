# assignments
ASSIGNMENT ?= ""
IGNOREDIRS := "^(\.git|bin|docs|lib)$$"
ASSIGNMENTS = $(shell find . -maxdepth 1 -mindepth 1 -type d | awk -F/ '{print $$NF}' | sort | grep -Ev $(IGNOREDIRS))

default: test

# output directories
TMPDIR ?= "/tmp/"
OUTDIR := $(shell mktemp -d "$(TMPDIR)$(ASSIGNMENT).XXXXXXXXXX")

# language specific config (tweakable per language)
FILEEXT := "rb"
EXAMPLE := "example.$(FILEEXT)"
SRCFILE := "$(shell echo $(ASSIGNMENT) | sed 's/-/_/g')"
TSTFILE := "$(SRCFILE)_test.$(FILEEXT)"

# single test
test-assignment:
	@echo ""
	@echo ""
	@echo "----------------------------------------------------------------"
	@echo "running tests for: $(ASSIGNMENT)"
	@cp -r $(ASSIGNMENT)/* $(OUTDIR)
	@cat $(ASSIGNMENT)/$(TSTFILE) | sed '/skip\s*$$/d' > $(OUTDIR)/$(TSTFILE)
	@cp $(ASSIGNMENT)/$(EXAMPLE) $(OUTDIR)/$(SRCFILE).$(FILEEXT)
	@ruby $(OUTDIR)/$(TSTFILE)

# all tests
test:
	@for assignment in $(ASSIGNMENTS); do \
		ASSIGNMENT=$$assignment $(MAKE) -s test-assignment || exit 1;\
	done

