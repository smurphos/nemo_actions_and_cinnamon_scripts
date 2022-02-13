#!/bin/bash
COMMAND="xdg-email"
for file in "$@"
do
  COMMAND="$COMMAND --attach '$file'"
done
sh -c "$COMMAND"
