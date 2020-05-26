#!/bin/bash

CONTENT=$(cat <<- EOM
  - A
  - B
  - C
  - $(pwd)
EOM
)

echo "$CONTENT" | ./components/target/debug/components
