#!/bin/bash

set -o nounset

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [ -f "$HOME/.tmux.conf" ]; then
  grep "source-file $ROOT_DIR/tmux.conf" $HOME/.tmux.conf &> /dev/null
  if [ $? == 0 ]; then
    echo "Already included $ROOT_DIR/tmux.conf in $HOME/.tmux.conf"
  else
    echo "Including $ROOT_DIR/tmux.conf in $HOME/.tmux.conf"
    echo "source-file $ROOT_DIR/tmux.conf" >> $HOME/.tmux.conf
  fi
else
  echo "Creating $HOME/.tmux.conf and including $ROOT_DIR/tmux.conf in it"
  touch $HOME/.tmux.conf
  echo "source-file $ROOT_DIR/tmux.conf" >> $HOME/.tmux.conf
fi
