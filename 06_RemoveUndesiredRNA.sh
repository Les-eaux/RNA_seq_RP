#!/usr/bin/env bash

REFS_DIR=/data/users/lwuetschert/rnaseq_course/References
READS_DIR=/data/users/lwuetschert/rnaseq_course/RNA_fastq

#SBATCH --cpus-per-task=1    #cores
#SBATCH --time=03:00:00       #time limit
#SBATCH --mem-per-cpu=8000M     #requested memory
#SBATCH --output=/data/users/lwuetschert/rnaseq_course/fastqc_output_%j.o         #output
#SBATCH --error=/data/users/lwuetschert/rnaseq_course/fastqc_error_%j.e          #error
#SBATCH --job-name=rnaseq_RP_BowtieIndex   #job name
#SBATCH --partition=pall

cd $READS_DIR

module load UHTS/Aligner/bowtie/0.12.9

zcat RPF_KO_Rep1_clpd_tr.fastq.gz | bowtie -S -t $REFS_DIR/GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb - \
--un RPF_KO_Rep1_clpd_tr_no_r_t_sno_sn_RNA.fastq 2> RPF_KO_Rep1_clpd_tr_no_r_t_sno_sn_RNA_log.txt > /dev/null

zcat RPF_KO_Rep2_clpd_tr.fastq.gz | bowtie -S -t $REFS_DIR/GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb - \
--un RPF_KO_Rep2_clpd_tr_no_r_t_sno_sn_RNA.fastq 2> RPF_KO_Rep2_clpd_tr_no_r_t_sno_sn_RNA_log.txt > /dev/null

zcat RPF_WT_Rep1_clpd_tr.fastq.gz | bowtie -S -t $REFS_DIR/GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb - \
--un RPF_WT_Rep1_clpd_tr_no_r_t_sno_sn_RNA.fastq 2> RPF_WT_Rep1_clpd_tr_no_r_t_sno_sn_RNA_log.txt > /dev/null

zcat RPF_WT_Rep2_clpd_tr.fastq.gz | bowtie -S -t $REFS_DIR/GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb - \
--un RPF_WT_Rep2_clpd_tr_no_r_t_sno_sn_RNA.fastq 2> RPF_WT_Rep2_clpd_tr_no_r_t_sno_sn_RNA_log.txt > /dev/null
