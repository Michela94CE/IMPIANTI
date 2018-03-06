#!/bin/bash

#mkdir ./global/EXP



grep "Free RAM" $1 | awk '{print $3 }' | sed 's/K//' > ./global/EXP/TotalFree_.txt
grep "Free RAM" $1 | awk '{print $5 }' | sed 's/K//' >  ./global/EXP/Free_chachedPSS.txt
grep "Free RAM" $1 | awk '{print $9 }' | sed 's/K//' >  ./global/EXP/Free_chached.txt
grep "Free RAM" $1 | awk '{print $13 }'| sed 's/K//' >  ./global/EXP/Free_free.txt

grep "Used RAM" $1 | awk '{print $3 }' | sed 's/K//' >  ./global/EXP/TotalUsed_.txt
grep "Used RAM" $1 | awk '{print $5 }' | sed 's/K//' >  ./global/EXP/Used_PSS.txt
grep "Used RAM" $1 | awk '{print $9 }' | sed 's/K//' >  ./global/EXP/Used_buffers.txt
#grep "Used RAM" $1 | awk '{print $12 }' >  ./global/EXP/Used_shmem.txt
#grep "Used RAM" $1 | awk '{print $15 }' >  ./global/EXP/Used_slab.txt
grep "Lost RAM" $1 | awk '{print $3 }' | sed 's/K//' >  ./global/EXP/LostRam.txt

#grep "ZRAM" $1 | awk '{print $2 }' >  ./global/EXP/ZRAMPhysicalUsed.txt
#grep "ZRAM" $1 | awk '{print $7 }' >  ./global/EXP/ZRAMinSWAP.txt
#grep "KSM" $1 | awk '{print $2 }' >  ./global/EXP/KSMsaved.txt
#grep "KSM" $1 | awk '{print $7 }' >  ./global/EXP/KSMshared.txt
#grep "volatile" $1 | awk '{print $1 }' >  ./global/EXP/KSMunshared.txt
#grep "volatile" $1 | awk '{print $4 }' >  ./global/EXP/KSMvolatile.txt


for filename in ./global/EXP/*.txt; do
echo $filename
Rscript analyze_other_mem_data.r  $filename >>memother_exp.txt
done
#rm -rf ./global/EXP
#mkdir ./global/EXP
