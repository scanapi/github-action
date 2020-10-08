#!/bin/bash

sh -c "scanapi $*"

if [ $1 != 'latest' ]; then
  pip install scanapi$1
else
  pip install scanapi
fi

