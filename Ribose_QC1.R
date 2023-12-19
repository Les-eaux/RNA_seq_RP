# debugging 

setwd("/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/")
file_path <- "/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/RiboseQC/R/riboseqc.R"
source(file_path)
# Step 3: Comment out line 2283
system("sed -i '' '2283s/^/# /' riboseqc.R")

# Step 4: Edit line 2694
system("sed -i '' '2694s/n_transcripts = length(unique(gtfdata$transcript_id))/n_transcripts = length(unique(na.omit(gtfdata$transcript_id)))/' RiboseQC/R/riboseqc.R")

# Step 5: Save your changes
# Note: This step is manual. Save the changes in RStudio.

# Step 6: Restart R (Cmd/Ctrl + Shift + 0 or Session > Restart R)
cat("Restart R in RStudio (Cmd/Ctrl + Shift + 0 or Session > Restart R).\n")

# Step 7: Remove current installation of RiboseQC
remove.packages("RiboseQC")

# Step 8: Navigate to the directory containing correct RiboseQC code
setwd("RiboseQC")

# Step 9: Build the package
system("R CMD build .")

# Step 10: Install the modified package
install.packages("RiboseQC_0.99.0.tar.gz", repos = NULL, type = "source")

# Step 11: Try QC analysis again
cat("Now, try to perform the QC analysis again using the modified version of RiboseQC.\n")

# In R studio (for example)
setwd("/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/")


# Installation of the package (to be done only once!)
install.packages("devtools")

library(usethis)
library("devtools")

install_github(repo = "ohlerlab/RiboseQC")

###### Analysis part ######

# Load the package
library("RiboseQC")

# Prepare genome file (to be done only once!!!)
prepare_annotation_files(annotation_directory = "/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/",
                         twobit_file = "/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/GRCh38.dna.primary_assembly.2bit",
                         gtf_file = "/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/Homo_sapiens.GRCh38.108.gtf",
                         scientific_name = "Homo.sapiens",
                         annotation_name = "GRCh38",
                         export_bed_tables_TxDb = F,
                         forge_BSgenome = T,
                         create_TxDb = T)


# Genome mapped sorted-BAM files

genome_bam <- c("/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/RPF_WT_Rep1_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
                "/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/RPF_WT_Rep2_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
                "/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/RPF_KO_Rep1_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
                "/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/RPF_KO_Rep2_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_sorted.bam")

load_annotation("/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/Homo_sapiens.GRCh38.108.gtf_Rannot")

###### QC plots ######

RiboseQC_analysis(annotation_file ="/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/Homo_sapiens.GRCh38.108.gtf_Rannot",
                  bam_files = genome_bam,
                  fast_mode = TRUE,
                  report_file = "/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/*.html",
                  sample_names = c("WT_Rep1", "WT_Rep2",
                                   "KO_Rep1", "KO_Rep2"),
                  dest_names = c("WT_Rep1", "WT_Rep2",
                                 "KO_Rep1", "KO_Rep2"),
                  write_tmp_files = F)



