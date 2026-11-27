# Feedback loop. The stack is not chosen yet, so recipes are stubs.
# Contract: `just check` is the single "is everything OK" command.
# Once a stack is chosen, change the recipe bodies, not their names.

set windows-shell := ["powershell.exe", "-NoLogo", "-NoProfile", "-Command"]

# List available recipes
default:
    @{{just_executable()}} --list

# Run everything: format check, lint, typecheck, tests
check: fmt-check lint typecheck test

# Format the code
fmt:
    @echo "fmt: stub, nothing to format yet"

# Check formatting without modifying files
fmt-check:
    @echo "fmt-check: stub"

# Static analysis
lint:
    @echo "lint: stub"

# Type checking
typecheck:
    @echo "typecheck: stub"

# Run tests
test:
    @echo "test: stub, no tests yet"
