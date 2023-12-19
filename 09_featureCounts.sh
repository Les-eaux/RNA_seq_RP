#!/usr/bin/env bash

#SBATCH --cpus-per-task=8    #cores
#SBATCH --time=01:00:00       #time limit
#SBATCH --mem-per-cpu=2500M     #requested memory
#SBATCH --output=/data/users/lwuetschert/rnaseq_course/outputFiles_output_%j.o         #output
#SBATCH --error=/data/users/lwuetschert/rnaseq_course/outputFiles_error_%j.e          #error
#SBATCH --job-name=rnaseq_RP_featureCounts   #job name
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pall


# Define your variables
SUBREAD_VERSION="2.0.2"                                             
GTF_FILE="Homo_sapiens.GRCh38.108.gtf"
READS_DIR=/data/users/lwuetschert/rnaseq_course/outputFiles

cd $READS_DIR

# Run featureCounts           
./subread-${SUBREAD_VERSION}-Linux-x86_64/bin/featureCounts -T 8 -t CDS \
    -a ${GTF_FILE} \
    -d 10 \
    -o feature_counts_raw.txt \
    ${READS_DIR}/*_GRCh38_sorted.bam


# Extract GeneID and Sample columns
cut -f 1,7-10 feature_counts_raw.txt > CDS_counts_processed.txt