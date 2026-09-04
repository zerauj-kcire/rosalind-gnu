#!/bin/bash

as=$(grep -o "A" rosalind_dna.txt | wc -l);
cs=$(grep -o "C" rosalind_dna.txt | wc -l);
gs=$(grep -o "G" rosalind_dna.txt | wc -l);
ts=$(grep -o "T" rosalind_dna.txt | wc -l);

echo $as $cs $gs $ts;
echo $as $cs $gs $ts | wl-copy;
