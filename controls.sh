#!/bin/bash

CURRENT_SLIDE=0

function slide_count() {
  ls ./slides | wc -l | sed 's/ //g'
}

function slide_list() {
  ls ./slides | sort
}

function current_slide() {
  slide_list | sed -n "${CURRENT_SLIDE}p"
}

function present() {
  ./slides/$1
}

function next_slide() {
  if [[ ! "$CURRENT_SLIDE" = "${slide_count}" ]]; then
    CURRENT_SLIDE=$((CURRENT_SLIDE + 1))
    present $(current_slide)
  fi
}

function previous_slide() {
  if [[ ! "$CURRENT_SLIDE" = "0" ]]; then
    CURRENT_SLIDE=$((CURRENT_SLIDE - 1))
    present ${current_slide}
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
