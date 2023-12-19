#!/usr/bin/env bash

#SBATCH --cpus-per-task=1    #cores
#SBATCH --time=01:00:00       #time limit
#SBATCH --mem-per-cpu=2000M     #requested memory
#SBATCH --output=/data/users/lwuetschert/rnaseq_course/outputFiles_output_%j.o         #output
#SBATCH --error=/data/users/lwuetschert/rnaseq_course/outputFiles_error_%j.e          #error
#SBATCH --job-name=rnaseq_RP_MultiQC   #job name
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pall

READS_DIR=/data/users/lwuetschert/rnaseq_course/outputFiles

cd $READS_DIR

module load UHTS/Analysis/MultiQC/1.8

multiqc .