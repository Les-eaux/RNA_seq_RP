#!/usr/bin/env bash
READS_DIR=/data/users/lwuetschert/rnaseq_course/RNA_fastq

#SBATCH --cpus-per-task=4    #cores
#SBATCH --time=02:00:00       #time limit
#SBATCH --mem-per-cpu=2000M     #requested memory
#SBATCH --output=/data/users/lwuetschert/rnaseq_course/fastqc_output_%j.o         #output
#SBATCH --error=/data/users/lwuetschert/rnaseq_course/fastqc_error_%j.e          #error
#SBATCH --job-name=rnaseq_RP_fastqc     #job name
#SBATCH --partition=pall

cd $READS_DIR

module load UHTS/Quality_control/cutadapt/2.5

# Clip 3' adapter
for x in $(ls -d *.fastq.gz); do echo ${x}; \
cutadapt \
-j 4 \
-a CTGTAGGCACCATCAAT \
-q 25 \
--minimum-length 25 \
--discard-untrimmed \
-o $(basename ${x} .fastq.gz)_clpd.fastq.gz \
${x} 1> $(basename ${x} .fastq.gz)_clpd_log.txt; done


# Trim 4 nt (randomized bases) from the 3' end
for x in $(ls -d *_clpd.fastq.gz); do echo ${x}; \
cutadapt \
-j 4 \
-q 25 \
--cut -4 \
--minimum-length 25 \
-o $(basename ${x} .fastq.gz)_tr.fastq.gz \
${x} 1> $(basename ${x} .fastq.gz)_tr_log.txt; done

