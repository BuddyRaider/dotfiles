#!/usr/bin/env bash

mpv --no-config --vo=tct --profile=sw-fast --ao='pulse' --vo-tct-buffering=frame "$1"
#mpv --no-config --vo=sixel --profile=sw-fast --vo-sixel-reqcolors=0 --ao='pulse' "$1"
