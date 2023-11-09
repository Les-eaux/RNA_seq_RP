#!/usr/bin/env bash

REFS_DIR=/data/users/lwuetschert/rnaseq_course/References

#SBATCH --cpus-per-task=1    #cores
#SBATCH --time=03:00:00       #time limit
#SBATCH --mem-per-cpu=8000M     #requested memory
#SBATCH --output=/data/users/lwuetschert/rnaseq_course/fastqc_output_%j.o         #output
#SBATCH --error=/data/users/lwuetschert/rnaseq_course/fastqc_error_%j.e          #error
#SBATCH --job-name=rnaseq_RP_BowtieIndex   #job name
#SBATCH --partition=pall

cd $REFS_DIR

module load UHTS/Aligner/bowtie/1.2.0

#undesired RNA annotation
bowtie-build undesired_RNA.fasta GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb

#Genome annotation
bowtie-build Homo_sapiens.GRCh38.dna.primary_assembly.fa GRCh38.dna.primary_assembly

#Transcriptome annotation
bowtie-build GRCh38_APPRIS_CDS_18.fa GRCh38_APPRIS_CDS_18