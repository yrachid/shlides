#!/bin/bash

CURRENT_SLIDE=0

quit_presentation() {
  tput reset
  exit 0
}

slides_location() {
  printf "${SLIDES_LOCATION}"
}

slide_count() {
  ls $(slides_location) | wc -l | sed 's/ //g'
}

slide_list() {
  ls $(slides_location) | sort
}

inline_slide_list() {
  slide_list | tr '\n' ' '
}

current_slide() {
  slide_list | sed -n "${CURRENT_SLIDE}p"
}

present() {
  tput reset
  $(slides_location)/$1
  wait_for_command
}

next_slide() {
  if [[ ! "$CURRENT_SLIDE" = "${slide_count}" ]]; then
    CURRENT_SLIDE=$((CURRENT_SLIDE + 1))
    present $(current_slide)
  fi
}

previous_slide() {
  if [[ ! "$CURRENT_SLIDE" = "0" ]]; then
    CURRENT_SLIDE=$((CURRENT_SLIDE - 1))
    present $(current_slide)
  fi
}

start_presentation() {
  clear
  printf "Instructions:\n"
  printf "  j: next slide\n"
  printf "  k: prev slide\n"
  printf "  q: quit\n\n"
  printf "Press any key to start"
  read -n1 whatever
  next_slide
}

wait_for_command() {
  read -n1 cmd
  case $cmd in
    j)
      next_slide
      ;;
    k)
      previous_slide
      ;;
    q)
      quit_presentation
      ;;
    *)
      wait_for_command
      ;;
  esac
}

