#!/bin/sh

# Build code, then flash it using flash.sh.
# Default target is set in .cargo/config.toml.
exec cargo +nightly-2021-01-07 run --release "$@"
