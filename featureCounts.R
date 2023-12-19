if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("Rsubread")


library("Rsubread")

genome_bam <- c("/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/RPF_WT_Rep1_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
                "/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/RPF_WT_Rep2_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
                "/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/RPF_KO_Rep1_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
                "/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/RPF_KO_Rep2_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_sorted.bam")

annotGTF <- "/Users/les.eaux/Desktop/UNIFR 2023:24/RNA-seq/PROJECT/Homo_sapiens.GRCh38.108.gtf"

featureCounts(files = genome_bam, 
              annot.ext = annotGTF, 
              isGTFAnnotationFile = T,
              GTF.featureType = "CDS",
              )


