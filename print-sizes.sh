#!/bin/sh

# Print sizes of functions, sorted by size.

FILE="${1:-$(pwd)/target/avr-atmega328p/release/rust-arduino-hello-world.elf}"
exec avr-nm --size-sort --reverse-sort --print-size --radix=decimal --line-numbers "$FILE"
