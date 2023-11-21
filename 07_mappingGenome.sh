#!/usr/bin/env bash

REFS_DIR=/data/users/lwuetschert/rnaseq_course/References
READS_DIR=/data/users/lwuetschert/rnaseq_course/outputFiles

#SBATCH --cpus-per-task=4    #cores
#SBATCH --time=03:00:00       #time limit
#SBATCH --mem-per-cpu=8000M     #requested memory
#SBATCH --output=/data/users/lwuetschert/rnaseq_course/fastqc_output_%j.o         #output
#SBATCH --error=/data/users/lwuetschert/rnaseq_course/fastqc_error_%j.e          #error
#SBATCH --job-name=rnaseq_RP_BowtieIndex   #job name
#SBATCH --partition=pall

cd $READS_DIR

module load UHTS/Aligner/bowtie/1.2.0
module load UHTS/Analysis/samtools/1.10


for x in $(ls -d *RNA.fastq); do echo ${x}; \
bowtie \
-S \
-t \
-p 4 \
-v 1 \
-m 1 \
--best \
--strata \
$REFS_DIR/GRCh38.dna.primary_assembly -q ${x} 2> $(basename ${x} .fastq)_GRCh38_log.txt | \
samtools view \
-h \
-F 4 \
-b > $(basename ${x} .fastq)_GRCh38.bam; done