#!/bin/bash

# input="try";
input="input.txt";

cat $input | tr "ATCG" "TAGC" | tr -d "\n"| tac -r -s "a\|[^a]";
