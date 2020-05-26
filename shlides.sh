#!/bin/bash -eu

CURRENT_SLIDE=0

readonly SLIDES_LOCATION="${1:-${PWD}/sample-slides}"

transition() {
  tput reset
}

quit_presentation() {
  transition
  exit 0
}

slides_location() {
  printf "${SLIDES_LOCATION}"
}

slide_count() {
  ls -1 $(slides_location) | wc -l | sed 's/ //g'
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
  local slide_to_present=${1:-1}
  transition
  $(slides_location)/$slide_to_present
  wait_for_command
}

next_slide() {
  if [ "$CURRENT_SLIDE" -lt "$(slide_count)" ]; then
    CURRENT_SLIDE=$((CURRENT_SLIDE + 1))
  fi

  present "$(current_slide)"
}

previous_slide() {
  if [ ! "$CURRENT_SLIDE" -eq "1" ]; then
    CURRENT_SLIDE=$((CURRENT_SLIDE - 1))
  fi

  present "$(current_slide)"
}

readonly GREETING=$(cat <<- EOM

_____________________
...::: SHLIDES :::...
_____________________

About the presentation:
 - slides location: $(slides_location)
 - slide count: $(slide_count)
 - slide list: $(inline_slide_list | tr '\n' ' ')

Get started:
  s: present from start
  q: quit
EOM
)

readonly INSTRUCTIONS=$(cat <<- EOM
Instructions:
  j: next slide
  k: prev slide
  q: quit

Press any key to start
EOM
)

start_presentation() {
  transition
  printf "$INSTRUCTIONS"
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

main() {
  transition

  printf "$GREETING\n"

  read -p "> " -n1 input

  case $input in
    q)
      quit_presentation
      ;;
    s)
      start_presentation
      ;;
    *)
      main
      ;;
  esac
}

main
