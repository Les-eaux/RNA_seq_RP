#!/usr/bin/env bash
READS_DIR=/data/users/lwuetschert/rnaseq_course/RNA_fastq

#SBATCH --cpus-per-task=4    #cores
#SBATCH --time=02:00:00       #time limit
#SBATCH --mem-per-cpu=1000M     #requested memory
#SBATCH --output=/data/users/lwuetschert/rnaseq_course/fastqc_output_%j.o         #output
#SBATCH --error=/data/users/lwuetschert/rnaseq_course/fastqc_error_%j.e          #error
#SBATCH --job-name=rnaseq_RP_fastqc     #job name
#SBATCH --partition=pall

cd $READS_DIR

module load UHTS/Quality_control/cutadapt/2.5

#clip 3' adapter
cutadapt -j 4 -q 25 -a CTGTAGGCACCATCAAT -m 25 --discard-untrimmed -o RPF_KO_Rep1_clpd.fastq.gz RPF_KO_Rep1.fastq.gz 
cutadapt -j 4 -q 25 -a CTGTAGGCACCATCAAT -m 25 --discard-untrimmed -o RPF_KO_Rep2_clpd.fastq.gz RPF_KO_Rep2.fastq.gz 
cutadapt -j 4 -q 25 -a CTGTAGGCACCATCAAT -m 25 --discard-untrimmed -o RPF_WT_Rep1_clpd.fastq.gz RPF_WT_Rep1.fastq.gz 
cutadapt -j 4 -q 25 -a CTGTAGGCACCATCAAT -m 25 --discard-untrimmed -o RPF_WT_Rep2_clpd.fastq.gz RPF_WT_Rep2.fastq.gz 

#trim 4nt
cutadapt -j 4 -q 25 -u -4 -m 25 --discard-untrimmed -o RPF_KO_Rep1_clpd_tr.fastq.gz  RPF_KO_Rep1_clpd.fastq.gz 
cutadapt -j 4 -q 25 -u -4 -m 25 --discard-untrimmed -o RPF_KO_Rep2_clpd_tr.fastq.gz  RPF_KO_Rep2_clpd.fastq.gz 
cutadapt -j 4 -q 25 -u -4 -m 25 --discard-untrimmed -o RPF_WT_Rep1_clpd_tr.fastq.gz  RPF_WT_Rep1_clpd.fastq.gz 
cutadapt -j 4 -q 25 -u -4 -m 25 --discard-untrimmed -o RPF_WT_Rep2_clpd_tr.fastq.gz  RPF_WT_Rep2_clpd.fastq.gz

