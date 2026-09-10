#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";

head -1 $input | sed "s/./&\n/g" >> out/init;
tail -1 $input | sed "s/./&\n/g" >> out/term;

# diff -y --suppress-common-lines out/init out/term | grep "^\w" > out/mydiff;

paste -d "\0" out/init out/term | grep -v "\(.\)\1" | wc -l;

# rm -r out;
