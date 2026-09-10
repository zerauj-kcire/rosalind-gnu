#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/{split,chains};

input="input.txt";
# input="try";

digits=$(grep -c ">" $input | tr -d "\n" | wc -m);

# cleaning:
cat $input | tr -d "[a-zR_]" > out/newin;
input="out/newin";

# separating in files:
csplit -s -n $digits $input '/>/' {*} -f out/split/d;
rm out/split/d000;
# rm out/split/d0;
for file in out/split/*; do
	name=$(head -1 $file | tr -d ">");
	mkdir out/chains/$name/;
	tail -n+2 $file > out/chains/$name/full;
	# getting the first and last characters:
	head -c3 out/chains/$name/full > out/chains/$name/1st;
	tail -c4 out/chains/$name/full | tr -d "\n" > out/chains/$name/2nd;
done

# it just matters the first character!!!!
for dir in out/chains/*; do
	for mdir in out/chains/*; do
		[ $dir == $mdir ] && continue;
		cmp --silent $dir/1st $mdir/2nd && \
			echo "$(basename $dir) $(basename $mdir)" >> out/results;
	done
	echo "done $dir";
done

cat out/results;

# rm -r out;
