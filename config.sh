
GENESET_FOLDER=/work/scratch/GSEA-REF/GENE_SET_v6

mkdir -p INPUT
cp /work/DATA2/chrisann/gsea/INPUT/* INPUT/
INPUT=INPUT
mkdir -p LOG

cp /work/software/gsea/Run.GSEA.R .
cp /work/software/gsea/gsea.sh .


ls $GENESET_FOLDER/* >> geneset_list.txt



