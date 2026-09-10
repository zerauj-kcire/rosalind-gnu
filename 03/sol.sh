#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";

cat $input | tr "TA" "AT" | tac -r -s 'a\|[^a]'

# rm -r out;
