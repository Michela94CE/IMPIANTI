#!/bin/bash

echo $1
#if [ $1!="input_temp/Displayed.txt" ];
#then
#Creo un file testuale Displayed.txt, che viene letto dallo script displayed.pl. IL PID inserito 0000 è FITTIZIO, non viene usato

#awk -F "\"*,\"*" '{print $4, "I/ActivityManager( 0000): ", $12}' LaunchTimes3ore.csv | grep Displayed > Displayed.txt
# sed 's/"//g' Displayed.txt >  Displayed2.txt

#else

perl -pe 's/\r\n|\n|\r/\n/g'  Displayed.txt  > Displayed2.txt


#echo yyyyy
#fi

perl displayed.pl Displayed2.txt
rm -rf Displayed.txt
rm -rf Displayed2.txt
for filename in ./*.txt; do
string=""
echo string $string
Rscript analyze_time_data.r $filename | grep -v "Call:" | grep -v NULL >tmp.txt
string=$(grep "Coefficients:" tmp.txt)
echo string $string
if [ "$string" = "Coefficients:" ];
then
echo Moving file...
echo $filename
mv $filename ./Time_results/
else
echo "NOT MATCH"
fi

rm -rf tmp.txt
done
rm -rf *.txt


