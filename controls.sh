#!/bin/bash

LAST_SLIDE=0

function slide_count() {
  ls ./slides | wc -l | sed 's/ //g'
}

function slide_list() {
  ls ./slides | sort
}

function next_slide() {
  if [[ ! "$LAST_SLIDE" = "${slide_count}" ]]; then
    LAST_SLIDE=$((LAST_SLIDE + 1))
    slide_list | sed -n "${LAST_SLIDE}p"
  fi
}

function previous_slide() {
  if [[ ! "$LAST_SLIDE" = "0" ]]; then
    LAST_SLIDE=$((LAST_SLIDE - 1))
    slide_list | sed -n "${LAST_SLIDE}p"
  fi
}

echo "Slide count:"
slide_count
echo

echo "Slide list:"
slide_list
echo

echo "Next slide:"
next_slide
echo

echo "Next slide:"
next_slide
echo

echo "Next slide:"
next_slide
echo

echo "Previous Slide:"
previous_slide
echo

echo "Previous Slide:"
previous_slide
echo
