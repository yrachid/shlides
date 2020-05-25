#!/bin/bash

readonly SLIDES_LOCATION="${1:-${PWD}/sample-slides}"

source ./controls.sh

start() {
  clear

  printf "\n\nSHLIDES\n\n"
  printf "About the presentation:\n"
  printf "  - slides location: $(slides_location)\n"
  printf "  - slide count: $(slide_count)\n"
  printf "  - slide list: $(inline_slide_list | tr '\n' ' ')\n"
  printf "\n"
  printf "Get started:\n"
  printf "  s: present from start\n"
  printf "  q: quit\n"
  printf "\n"
  read -p "> " -n1 input

  case $input in
    q)
      clear
      exit 0
      ;;
    s)
      start_presentation
      ;;
    *)
      start
      ;;
  esac
}

start
