library(dplyr)

setwd("~/Google Drive/My Drive/UCalgary/Year 4/MDSC 301/MDSC 301 Winter 2024/Manuscript/working files/FASTQC/VC/TIDDIT/")

SS746_tiddit <- read.table("SS746_Het.vcf", header = F, sep = "\t")
N2_tiddit <- read.table("N2.vcf", header = F, sep = "\t")

header <- c("#CHROM", "POS", "ID", "REF",	"ALT", "QUAL",	"FILTER",	"INFO", "FORMAT", "Genotype")
colnames(SS746_tiddit)[1:10] <- header
colnames(N2_tiddit)[1:10] <- header

SS746_tiddit <- subset(SS746_tiddit, FILTER %in% c("PASS"))
N2_tiddit <- subset(N2_tiddit, FILTER %in% c("PASS"))

duplicates <- intersect(SS746_tiddit$POS, N2_tiddit$POS)

# Filter out these duplicates from SS746_tiddit
SS746_tiddit_filtered <- subset(SS746_tiddit, !POS %in% duplicates)

write.csv(SS746_tiddit_filtered, "SS746_tiddit_filtered.csv", row.names = F)

##############

setwd("~/Google Drive/My Drive/UCalgary/Year 4/MDSC 301/MDSC 301 Winter 2024/Manuscript/working files/FASTQC/VC/Delly Call/")

SS746_delly <- read.table("SS746.vcf", header = F, sep = "\t")
N2_delly <- read.table("N2.vcf", header = F, sep = "\t")

header <- c("#CHROM", "POS", "ID", "REF",	"ALT", "QUAL",	"FILTER",	"INFO", "FORMAT", "Genotype")
colnames(SS746_delly)[1:10] <- header
colnames(N2_delly)[1:10] <- header

SS746_delly <- subset(SS746_delly, FILTER %in% c("PASS"))
N2_delly <- subset(N2_delly, FILTER %in% c("PASS"))

duplicates <- intersect(SS746_delly$POS, N2_delly$POS)

# Filter out these duplicates from SS746_delly
SS746_delly_filtered <- subset(SS746_delly, !POS %in% duplicates)

write.csv(SS746_delly_filtered, "SS746_delly_filtered.csv", row.names = F)

##############

setwd("~/Google Drive/My Drive/UCalgary/Year 4/MDSC 301/MDSC 301 Winter 2024/Manuscript/working files/FASTQC/VC/Basil/")

SS746_basil <- read.table("SS746.vcf", header = F, sep = "\t")
N2_basil <- read.table("N2.vcf", header = F, sep = "\t")

header <- c("#CHROM", "POS", "ID", "REF",	"ALT", "QUAL",	"FILTER",	"INFO", "FORMAT", "Genotype")
colnames(SS746_basil)[1:10] <- header
colnames(N2_basil)[1:10] <- header

SS746_basil <- subset(SS746_basil, FILTER %in% c("PASS"))
N2_basil <- subset(N2_basil, FILTER %in% c("PASS"))

duplicates <- intersect(SS746_basil$POS, N2_basil$POS)

# Filter out these duplicates from SS746_basil
SS746_basil_filtered <- subset(SS746_basil, !POS %in% duplicates)

write.csv(SS746_basil_filtered, "SS746_basil_filtered.csv", row.names = F)


