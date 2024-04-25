#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    brew install go

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    #FIXME install umake
    umake go
fi