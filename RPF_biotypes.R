library(ggplot2)
library(viridis)
library(dplyr)

data <- read.table(file = "CDS_counts_processed.txt", sep = "\t", header = TRUE)

# Rearrange data so that it matches the next step
data <- data[ , c(1, 4, 5, 2, 3)]

## Rename columns
colnames(data) <- c("Biotype",
                    "WT_1", "WT_2",
                    "KO_1", "KO_2")

## Remove rows with 0 reads in all samples

data <- subset(data, rowSums(data[ , c(2:5)], ) > 0)

# Transforming the data
data_for_plot <- tidyr::gather(data, "Condition", "Reads", 2:5)

# One way of defining sample order

sample_order <- c("WT_1", "WT_2",
                  "KO_1", "KO_2")


# Get the number of biotypes
num_biotypes <- nrow(data)

# Generate colors using viridis
Color <- viridis(num_biotypes)

# Plot

pdf("RPF_biotypes.pdf", paper = "a4r", useDingbats = FALSE)
ggplot(data_for_plot, 
       aes(x = factor(Condition, levels = sample_order),
           y = Reads,
           fill = Biotype)) + 
  geom_bar(position = "fill",
           stat = "identity",
           color = "black") +
  scale_fill_manual(values = Color) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90)) +
  xlab("") +
  ylab("Proportion of mapped reads")
dev.off()
