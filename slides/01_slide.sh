#!/bin/bash

readonly COLUMNS=$(tput cols)
readonly LINES=$(tput lines)
readonly VERTICAL_CENTER_OFFSET=$((LINES / 2))

for i in $(seq 1 $VERTICAL_CENTER_OFFSET)
do
  printf "\n"
done

title="\033[1mI am bold text.\033[0m"

readonly CENTERED_CONTENT_LENGTH=$((${#title} + $COLUMNS))
readonly HORIZONTAL_OFFSET=$(($CENTERED_CONTENT_LENGTH / 2))

printf "%*b\n" $HORIZONTAL_OFFSET "$title"
