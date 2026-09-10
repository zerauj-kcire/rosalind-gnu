#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/{sp,fin};

input="input.txt";
# input="try";

csplit -s -n 1 $input '/>/' {*} -f out/sp/d;
rm out/sp/d0;

for file in out/sp/d*; do
	title=$(head -1 $file | tr -d ">Rosalind_");
	tail -n+2 $file > out/fin/$title;
	mc=$(cat out/fin/$title | tr -d "\n" | wc -m);
	fc=$(cat out/fin/$title | tr -d "TA\n" | wc -m);
	num=$(echo "scale=6;100 * $fc/$mc" | bc);
	echo $title $num >> out/results;
done

echo -n "Rosalind_" >> out/ans;
sort -k 2n,2 out/results | tail -1 | sed "s/..\./\n&/g" >> out/ans;

# rm -r out;

