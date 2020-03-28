#!/usr/bin/env bash

set -e

for x in *.py
do
  python3 $x
done