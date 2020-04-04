#!/bin/bash
FILENAME="screenshot-`date +%F-%T`"
/usr/bin/grim -g "$(/usr/bin/slurp)" ~/Pictures/Screenshots/$FILENAME.png
