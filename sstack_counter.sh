#!/bin/bash
touch total
touch counts.txt
while IFS=, read -r  col1
do
    list=$(echo "$col1")
    names=$(echo $list | awk '{print $2}')
    echo ${names} >> total
    sed -n '13p' < sstack_1_nov_${names}.log | awk '{print $9}'>>total 
    sed -n '13p' < sstack_1_nov_${names}.log | awk '{print $1}'>>total 
    sed -n '14p' < sstack_1_nov_${names}.log | awk '{print $1}'>>total
sed -n '14p' < sstack_1_nov_${names}.log | awk '{print $4}' >>total
sed -n '15p' < sstack_1_nov_${names}.log | awk '{print $1}'>>total
sed -n '16p' < sstack_1_nov_${names}.log | awk '{print $1}' >>total
 sed -n '17p' < sstack_1_nov_${names}.log | awk '{print $1}' >>total
sed -n '17p' < sstack_1_nov_${names}.log | awk '{print $8}' >>total
sed -n '19p' < sstack_1_nov_${names}.log | awk '{print $6}'>> total
sed -n '20p' < sstack_1_nov_${names}.log | awk '{print $1}' >>total
sed -n '20p' < sstack_1_nov_${names}.log | awk '{print $7}'>>total 
sed -n '20p' < sstack_1_nov_${names}.log | awk '{print $11}'>>total 
sed -n '21p' < sstack_1_nov_${names}.log | awk '{print $1}' >>total
sed -n '22p' < sstack_1_nov_${names}.log | awk '{print $1}' >>total
sed -n '23p' < sstack_1_nov_${names}.log | awk '{print $1}'>>total
sed -n '24p' < sstack_1_nov_${names}.log | awk '{print $1}' >>total
sed -n '25p' < sstack_1_nov_${names}.log | awk '{print $1}'>>total
    tr "\n" "\t" <  total > counts.txt
    sed 's/614_/\n614_/g'< counts.txt > counts2.txt
    sed 's/210_/\n210_/g'< counts2.txt > Final_sstack_Values_arlet.txt
done < ../barcodes.csv
sed -i '1 i\Sample\tCatalog loci\tSample loci\tMatching loci\tno varified haplotypes\tambigous loci\tLoci with unaccounted SNPs\tTotal haplotypes\tVerified haplotypes\tGapped alignments\tMatched loci\tTotal haplotypes\tVerified haplotypes\tUnmatched loci\tAmbigous loci\tLoci with unaccounted SNPs\tNo verified haplotypes\tInconsistent alignments' Final_sstack_Values_arlet.txt
sed -i '2d' Final_sstack_Values_arlet.txt
#rm counts.txt
#rm counts2.txt
#rm total

