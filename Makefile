# Default variables
CARGO = cargo

.PHONY: all build release run test check fmt fmt-fix clippy deny clean help

# Default target runs formatting, linting, tests, and builds the project
all: fmt clippy test build

## build: Compile the project in debug mode
build:
	$(CARGO) $@

## release: Compile the project with optimizations (Release mode)
release:
	$(CARGO) build --release

## run: Run the project
run:
	$(CARGO) $@

## test: Run all tests (unit, integration, and doc-tests)
test:
	$(CARGO) $@

## check: Quickly check the code for errors without compiling binaries
check:
	$(CARGO) $@

## fmt: Check code formatting according to the Rust style guide
fmt:
	$(CARGO) $@ --all -- --check

## fmt-fix: Reformat the code in place according to the Rust style guide
fmt-fix:
	$(CARGO) fmt --all

## clippy: Run the linter (strict mode: treats all warnings as errors)
clippy:
	$(CARGO) $@ --all-targets --all-features -- -D warnings

## deny: Audit dependencies for advisories, licenses, bans, and sources
deny:
	$(CARGO) $@ check

## clean: Remove build artifacts and the target directory
clean:
	$(CARGO) $@

## help: Show this help message with available commands
help:
	@echo "Available commands:"
	@sed -n 's/^## //p' $(MAKEFILE_LIST) | awk '{ i = index($$0, ": "); printf "  %-10s %s\n", substr($$0, 1, i - 1), substr($$0, i + 2) }'
