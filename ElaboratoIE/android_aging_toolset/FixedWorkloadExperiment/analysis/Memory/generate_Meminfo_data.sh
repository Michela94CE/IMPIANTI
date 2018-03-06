#!/bin/bash

rm -rf ./CSVs/*.csv

#grep -A 100 "Total PSS by process:" $1 | sed -n '/--/,/OOM/p' | grep -v "Total PSS by process:" | grep  '[[:blank:]]' | sed 's/Total PSS by OOM adjustment:/--/' | awk '{print $1 , $3 }' | ./excel_gen.py

./excel_gen.py $1

for filename in CSVs/*.csv; do
echo $filename
Rscript analyze_data.r $filename
done

#rm -rf ./CSVs/*.csv
