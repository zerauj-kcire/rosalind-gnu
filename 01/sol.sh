#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="rosalind_dna.txt";

a=$(grep -o "A" $input | wc -l);
c=$(grep -o "C" $input | wc -l);
g=$(grep -o "G" $input | wc -l);
t=$(grep -o "T" $input | wc -l);

echo $a $c $g $t;

# rm -r out;
