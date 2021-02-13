#!/usr/bin/bash
set -eu

# Use first argument as file name, when called by cargo, or default to
# "rust-arduino-blink.elf", when called directly.
FILE="${1:-$(pwd)/target/avr-atmega328p/release/rust-arduino-hello-world.elf}"

# UART device to use, when flashing to Arduino.
UART_DEVICE="/dev/ttyUSB0"

# If script called directly, but file is not found, then try to build code.
[ -f "$FILE" ] || { cargo +nightly-2021-01-07 build --release || exit 1 ; }

# If file is still not found, then something is wrong.
[ -f "$FILE" ] || { echo "ERROR: File \"$FILE\" is not found." >&2 ; exit 1; }

# Flash PROM
exec avrdude -q -patmega328p -carduino -P"$UART_DEVICE" -D -U "flash:w:$FILE:e"
