# List available just recipes
@help:
    # This command lists all available just recipes in the current justfile.
    just --list

# Format the codebase
@fmt:
    # This command formats all Rust code using the nightly version of rustfmt.
    cargo +nightly fmt --all
    # This command formats all TOML files using taplo.
    taplo format
    # This command formats all files according to the hawkeye configuration.
    hawkeye format

# Alias for linting
alias l := lint

# Lint the codebase
@lint:
    # This command checks the codebase for issues according to the hawkeye configuration.
    hawkeye check
    # This command checks the formatting of all TOML files.
    taplo format --check
    # This command checks the Rust codebase for errors and warnings.
    cargo check --all --all-features --all-targets
    # This command runs clippy to lint the Rust codebase and treats warnings as errors.
    cargo clippy --all-targets --workspace -- -D warnings

# Calculate lines of code
@cloc:
    # This command calculates the lines of code in the project, excluding specified directories.
    cloc . --exclude-dir=vendor,docs,tests,examples,build,scripts,tools,target

# Run example
@example-hello:
    # This command runs the hello-world example.
    cargo run --example hello-world

# Run binary
@run:
    # This command runs the binary package.
    cargo run --package binary hello

# Alias for testing
alias t := test

# Run tests
@test:
    # This command runs all tests in the workspace using nextest.
    cargo nextest run --workspace