#!/bin/sh

# Build code using nightly compiler.
# Default target is set in .cargo/config.toml.
exec cargo +nightly-2021-01-07 build --release "$@"
