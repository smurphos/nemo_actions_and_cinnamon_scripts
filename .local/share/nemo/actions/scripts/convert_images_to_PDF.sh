#!/bin/bash
convert -quality 100 "$@" "${1%.*}_$RANDOM.pdf"
