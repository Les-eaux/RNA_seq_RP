#!/usr/bin/env bash

#SBATCH --cpus-per-task=4    #cores
#SBATCH --time=01:00:00       #time limit
#SBATCH --mem-per-cpu=1000M     #requested memory
#SBATCH --output=/data/users/lwuetschert/rnaseq_course/fastqc_output_%j.o         #output
#SBATCH --error=/data/users/lwuetschert/rnaseq_course/fastqc_error_%j.e          #error
#SBATCH --job-name=rnaseq_RP_Data    #job name
#SBATCH --partition=pall

wget https://filesender.switch.ch/filesender2/download.php?token=7a5bdf5e-2b35-432a-a90d-0e982cc2f442&files_ids=525885
wget https://filesender.switch.ch/filesender2/download.php?token=7a5bdf5e-2b35-432a-a90d-0e982cc2f442&files_ids=525886
wget https://filesender.switch.ch/filesender2/download.php?token=7a5bdf5e-2b35-432a-a90d-0e982cc2f442&files_ids=525887
wget https://filesender.switch.ch/filesender2/download.php?token=7a5bdf5e-2b35-432a-a90d-0e982cc2f442&files_ids=525888

# We'll rename the files in the console right after downloading it