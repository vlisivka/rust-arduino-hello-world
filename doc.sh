#!/bin/sh

# Generate documentation for code and libraries, and open it in a browser.
exec cargo +nightly-2021-01-07 doc --open "$@"
