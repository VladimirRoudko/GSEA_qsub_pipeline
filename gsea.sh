
#! /bin/bash
#$ -pe smp 1
#$ -cwd
#$ -N gsea_R
#$ -e LOG/
#$ -o LOG/

# number of threads
NT=1

. /etc/profile.d/sge.sh

exec 1>log_gsea.out
exec 2>log_gsea.err

GENESET_FOLDER=/work/scratch/GSEA-REF/GENE_SET_v6
INPUT=INPUT
GENESET=$(awk NR==$SGE_TASK_ID geneset_list.txt | awk -F'[./]' '{print $(NF-1)}')

mkdir $GENESET

for i in $INPUT/*.gct
do
filename=$(echo $i | awk -F'[./]' '{print $(NF-1)}')
mkdir $GENESET/$filename
Rscript Run.GSEA.R "$INPUT/$filename.gct" "$INPUT/$filename.cls" "$GENESET_FOLDER/$GENESET.gmt" "$GENESET/$filename/" "$filename"_"$GENESET"
done







