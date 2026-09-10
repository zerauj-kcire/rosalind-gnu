#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/chains;

input="input.txt";
# input="try";

head -1 $input > out/s;
t=$(tail -1 $input);

n=$(wc -m out/s --total=only);

for i in $(seq 2 $((n-1)) ); do
	head -c+$i out/s > out/chains/$i;
	echo "done $i";
done

sed -i "s/$t$//g" out/chains/*;

for file in out/chains/*; do
	length=$(wc -m $file --total=only);
	name=$(basename $file);
	[ $length -ne $name ] && echo $((length+1)) >> out/results;
	echo "done $file";
done

sort -n out/results | tr "\n" " " > out/final;
cat out/final;

# rm -r out;
