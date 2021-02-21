#!/bin/sh

# Print dump of compiled elf file with disassembled code and corresponding source.

FILE="${1:-$(pwd)/target/avr-atmega328p/release/rust-arduino-hello-world.elf}"
exec avr-objdump --source --line-numbers "$FILE"
