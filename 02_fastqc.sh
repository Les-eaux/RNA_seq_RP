#!/usr/bin/env bash

#SBATCH --cpus-per-task=4    #cores
#SBATCH --time=02:00:00       #time limit
#SBATCH --mem-per-cpu=8000M     #requested memory
#SBATCH --output=/data/users/lwuetschert/rnaseq_course/fastqc_output_%j.o         #output
#SBATCH --error=/data/users/lwuetschert/rnaseq_course/fastqc_error_%j.e          #error
#SBATCH --job-name=rnaseq_RP_fastqc     #job name
#SBATCH --partition=pall

READS_DIR=/data/users/lwuetschert/rnaseq_course/outputFiles

cd $READS_DIR

module load UHTS/Quality_control/fastqc/0.11.9

fastqc *.fastq.gz
