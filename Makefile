# assignments
ASSIGNMENT ?= ""
IGNOREDIRS := "^(\.git|bin)$$"
ASSIGNMENTS = $(shell find . -maxdepth 1 -mindepth 1 -type d | awk -F/ '{print $$NF}' | sort | grep -Ev $(IGNOREDIRS))

default: test

# output directories
TMPDIR ?= "/tmp"
OUTDIR := $(shell mktemp -d "$(TMPDIR)/$(ASSIGNMENT).XXXXXXXXXX")

# language specific config (tweakable per language)
FILEEXT := "rb"
EXAMPLE := "example.$(FILEEXT)"
TSTFILE := "$(shell echo $(ASSIGNMENT) | sed 's/-/_/g')_test.$(FILEEXT)"

# single test
test-assignment:
	@echo ""
	@echo ""
	@echo "----------------------------------------------------------------"
	@echo "running tests for: $(ASSIGNMENT)"
	@cat $(ASSIGNMENT)/$(TSTFILE) | sed '/skip\s*$$/d' > $(OUTDIR)/$(TSTFILE)
	@cp $(ASSIGNMENT)/$(EXAMPLE) $(OUTDIR)/$(EXERCISE).$(FILEEXT)
	@ruby $(OUTDIR)/$(TSTFILE)

# all tests
test:
	@for assignment in $(ASSIGNMENTS); do \
		exercise=$$(echo $$assignment | sed 's/-/_/g') \
		ASSIGNMENT=$$assignment EXERCISE=$$exercise $(MAKE) -s test-assignment || exit 1;\
	done

