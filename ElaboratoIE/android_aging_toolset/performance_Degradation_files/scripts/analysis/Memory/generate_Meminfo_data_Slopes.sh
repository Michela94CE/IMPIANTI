#!/bin/bash

rm -rf ./CSVs/*.csv

grep -A 100 "Total PSS by process:" $1 | sed -n '/--/,/OOM/p' | grep -v "Total PSS by process:" | grep  '[:blank:]' | sed 's/Total PSS by OOM adjustment:/--/' | awk '{print $1 , $3 }' | ./excel_gen.py

for filename in ./CSVs/*.csv; do
#echo $filename

Rscript analyze_data_slopes.r $filename | grep -v "Call:" | grep -v NULL | grep -v "Levels" | grep -v "Coefficients:" | grep -v Intercept | grep -v -e '^$' >> slopes_exp.txt
echo >> slopes_exp.txt
done

rm -rf ./CSVs/*.csv


