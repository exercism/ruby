# assignments
ASSIGNMENT ?= ""
IGNOREDIRS := "^(\.git|bin|docs|lib|exercises)$$"
ASSIGNMENTS = $(shell find ./exercises -maxdepth 1 -mindepth 1 -type d | awk -F/ '{print $$NF}' | sort | grep -Ev $(IGNOREDIRS))

default: test

# output directories
TMPDIR ?= "/tmp/"
OUTDIR := $(shell mktemp -d "$(TMPDIR)$(ASSIGNMENT).XXXXXXXXXX")

# language specific config (tweakable per language)
FILEEXT := "rb"
EXAMPLE := "example.$(FILEEXT)"
SRCFILE := "$(shell echo $(ASSIGNMENT) | sed 's/-/_/g')"
TSTFILE := "$(SRCFILE)_test.$(FILEEXT)"
SPECFILE := "$(SRCFILE)_spec.$(FILEEXT)"
# Any additional arguments, such as -p for pretty output and others
ARGS ?= ""

# single test
test-assignment:
	@echo ""
	@echo ""
	@echo "----------------------------------------------------------------"
	@pwd
	@echo "running tests for: $(ASSIGNMENT)"
	@cp -r ./exercises/$(ASSIGNMENT)/* $(OUTDIR)
	@cp -r ./exercises/$(ASSIGNMENT)/.rspec $(OUTDIR)/.rspec
	@cp ./exercises/$(ASSIGNMENT)/$(EXAMPLE) $(OUTDIR)/$(SRCFILE).$(FILEEXT)
	@ruby -I./lib -rdisable_skip.rb $(OUTDIR)/$(TSTFILE) $(ARGS)
	@./bin/rspec-test-in $(OUTDIR)
	@rm -rf $(OUTDIR)

# all tests
test:
	@for assignment in $(ASSIGNMENTS); do \
		ASSIGNMENT=$$assignment $(MAKE) -s test-assignment || exit 1;\
	done

seed_rspec:
	@for assignment in $(ASSIGNMENTS); do \
		ASSIGNMENT=$$assignment $(MAKE) -s seed_individual_assignment_with_rspec || exit 1;\
	done

seed_individual_assignment_with_rspec:
	@cd ./exercises/$(ASSIGNMENT) && bundle init && echo 'gem "rspec", "~> 3.4.0"' >> Gemfile || exit 0
	@cd ./exercises/$(ASSIGNMENT) && bundle install
	@cd ./exercises/$(ASSIGNMENT) && echo '--color\n--order=random\n--pattern *_spec.rb' > .rspec
