#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --time=02:00:00
#SBATCH --mem-per-cpu=8000M     #requested memory
#SBATCH --output=/data/users/lwuetschert/rnaseq_course/fastqc_output_%j.o         #output
#SBATCH --error=/data/users/lwuetschert/rnaseq_course/fastqc_error_%j.e          #error
#SBATCH --job-name=rnaseq_RP_BowtieMapping_Transcriptome   #job name
#SBATCH --partition=pall

REFS_DIR=/data/users/lwuetschert/rnaseq_course/References
READS_DIR=/data/users/lwuetschert/rnaseq_course/outputFiles

cd $READS_DIR

module load UHTS/Aligner/bowtie/1.2.0
module load UHTS/Analysis/samtools/1.10


for x in $(ls -d *_no_r_t_sno_sn_RNA.fastq); do echo ${x}; \
bowtie \
-t \
-p 4 \
-v 1 \
-m 1 \
--best \
--strata \
--norc \
$REFS_DIR/GRCh38_APPRIS_CDS_18 \
-q ${x} \
-S $(basename ${x} .fastq)_GRCh38_APPRIS_CDS.sam 2> $(basename ${x} .fastq)_GRCh38_APPRIS_CDS_log.txt; done
