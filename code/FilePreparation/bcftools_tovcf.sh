#!/bin/bash -l
#SBATCH --time=48:00:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=126gb
#SBATCH --account=UniKoeln
#SBATCH --mail-user=jgoncal1@uni-koeln.de
#SBATCH --error /scratch/jgoncal1/logs/errors/bacftools_convert_%j
#SBATCH -o /scratch/jgoncal1/logs/bacftools_convert_%j
#SBATCH -D /projects/ag-stetter/jdias/projects/geneflow/code/


source /home/jgoncal1/.bashrc
module load miniconda/py38_4.9.2
conda activate base_jgd 

vcf_file_prefix="../data/processed/reheadered_Scaffold_" # preifx of files generated by csplit
for scaffold in {1..15};do # loop per scaffold

echo $vcf_file_prefix$scaffold.vcf.gz 

bcftools view -Oz -o  ../data/processed/$vcf_file_prefixd$scaffold.vcf.gz  $vcf_file_prefix$scaffold.bcf


tabix -p vcf ../data/processed/$vcf_file_prefixd$scaffold.vcf.gz

done