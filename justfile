# List available just recipes
@help:
    just -l

@fmt:
    cargo +nightly fmt --all
    taplo format
    taplo format --check
    hawkeye format

# Calculate code
@cloc:
    cloc . --exclude-dir=vendor,docs,tests,examples,build,scripts,tools,target

# Example
@example-hello:
    cargo run --example hello-world

# Binary
@run:
    cargo run --package binary hello

alias c := check
@check:
    cargo check --all --all-features --all-targets
    cargo clippy --all-targets --workspace -- -D warnings

alias t := test
@test:
    cargo nextest run --workspace