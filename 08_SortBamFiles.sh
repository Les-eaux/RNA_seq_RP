#!/usr/bin/env bash

READS_DIR=/data/users/lwuetschert/rnaseq_course/outputFiles

#SBATCH --cpus-per-task=4    #cores
#SBATCH --time=01:00:00       #time limit
#SBATCH --mem-per-cpu=25000M     #requested memory
#SBATCH --output=/data/users/lwuetschert/rnaseq_course/outputFiles_output_%j.o         #output
#SBATCH --error=/data/users/lwuetschert/rnaseq_course/outputFiles_error_%j.e          #error
#SBATCH --job-name=rnaseq_RP_sortBam   #job name
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pall

cd $READS_DIR

module load UHTS/Analysis/samtools/1.10

for x in $(ls -d *.bam); do cat ${x}; \
samtools sort \
-@ 4 \
${x} \
-o $(basename ${x} .bam)_sorted.bam; done

rm *GRCh38.bam