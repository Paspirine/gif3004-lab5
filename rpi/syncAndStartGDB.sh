#!/bin/bash
set -e

# Sync executable
bn=$(basename $1)
rsync -az $1/build/tp5client setr:/home/pi/projects/laboratoire5/tp5client
