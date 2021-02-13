#!/bin/sh

# Run screen for bidirectional communication with device.
# Use <ctrl-a> <\> <y> to quit.
exec screen /dev/ttyUSB0 115200
