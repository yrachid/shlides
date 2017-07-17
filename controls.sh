#!/bin/bash

LAST_SLIDE=1

function slide_count() {
  ls ./slides | wc -l | sed 's/ //g'
}

function slide_list() {
  ls ./slides | sort
}

function next_slide() {
  slide_list | sed -n "${LAST_SLIDE}p"
}

echo "Slide count:"
slide_count
echo

echo "Slide list:"
slide_list
echo

echo "Next slide:"
next_slide
