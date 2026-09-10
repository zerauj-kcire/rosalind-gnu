#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";

cat $input | tr "TA" "UX";

# rm -r out;
