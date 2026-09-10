#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";


fold -w 3 $input > out/folded;

sed "s/UUU/F/; \
	s/CUU/L/; \
	s/AUU/I/; \
	s/GUU/V/; \
	s/UUC/F/; \
	s/CUC/L/; \
	s/AUC/I/; \
	s/GUC/V/; \
	s/UUA/L/; \
	s/CUA/L/; \
	s/AUA/I/; \
	s/GUA/V/; \
	s/UUG/L/; \
	s/CUG/L/; \
	s/AUG/M/; \
	s/GUG/V/; \
	s/UCU/S/; \
	s/CCU/P/; \
	s/ACU/T/; \
	s/GCU/A/; \
	s/UCC/S/; \
	s/CCC/P/; \
	s/ACC/T/; \
	s/GCC/A/; \
	s/UCA/S/; \
	s/CCA/P/; \
	s/ACA/T/; \
	s/GCA/A/; \
	s/UCG/S/; \
	s/CCG/P/; \
	s/ACG/T/; \
	s/GCG/A/; \
	s/UAU/Y/; \
	s/CAU/H/; \
	s/AAU/N/; \
	s/GAU/D/; \
	s/UAC/Y/; \
	s/CAC/H/; \
	s/AAC/N/; \
	s/GAC/D/; \
	s/UAA/Stop/; \
	s/CAA/Q/; \
	s/AAA/K/; \
	s/GAA/E/; \
	s/UAG/Stop/; \
	s/CAG/Q/; \
	s/AAG/K/; \
	s/GAG/E/; \
	s/UGU/C/; \
	s/CGU/R/; \
	s/AGU/S/; \
	s/GGU/G/; \
	s/UGC/C/; \
	s/CGC/R/; \
	s/AGC/S/; \
	s/GGC/G/; \
	s/UGA/Stop/; \
	s/CGA/R/; \
	s/AGA/R/; \
	s/GGA/G/; \
	s/UGG/W/; \
	s/CGG/R/; \
	s/AGG/R/; \
	s/GGG/G/" out/folded > out/string;

csplit --suppress-matched out/string '/Stop/' -f out/final;
cat out/final00 | tr -d "\n" > out/ans;

# rm -r out;
