library(dplyr)

setwd("~/Google Drive/My Drive/UCalgary/Year 4/MDSC 301/MDSC 301 Winter 2024/Manuscript/working files/FASTQC/VC/")

delly <- read.table("SS746_delly_filtered.csv", sep = ",", header = T)
manta <- read.table("SS746_manta_diploidSV_filtered.csv", sep = ",", header = T)
basil <- read.table("SS746_basil_filtered.csv", sep = ",", header = T)
tiddit <- read.table("SS746_tiddit_filtered.csv", sep = ",", header = T)

duplicates <- intersect(delly$POS, manta$POS, basil$POS, tiddit$POS)

delly$source <- 'delly'
manta$source <- 'manta'
basil$source <- 'basil'
tiddit$source <- 'tiddit'

combined_df <- rbind(delly, manta, basil, tiddit)

find_close_matches <- function(df) {
  # An empty dataframe to store matches
  matches_df <- data.frame(POS=integer(), source=character(), stringsAsFactors=FALSE)
  
  for (pos in df$POS) {
    # Find rows where POS is within 50 base pairs
    close_matches <- df %>% 
      filter(POS >= pos - 50 & POS <= pos + 50) %>%
      distinct(source) %>% 
      nrow()
    
    # If matches are found in at least three sources, add them to the matches dataframe
    if (close_matches >= 3) {
      matches_df <- rbind(matches_df, df[df$POS == pos, ])
    }
  }
  
  # Remove duplicate rows
  unique(matches_df)
}

# Split the matched dataframes by their source
matched_delly <- matched_df[matched_df$source == 'delly', ]
matched_manta <- matched_df[matched_df$source == 'manta', ]
matched_basil <- matched_df[matched_df$source == 'basil', ]
matched_tiddit <- matched_df[matched_df$source == 'tiddit', ]

# Find matches
matched_df <- find_close_matches(combined_df)

matched_ChrI <- subset(matched_df, X.CHROM == "I")
write.table(matched_ChrI, "matched_ChrI.csv", col.names = T, sep = ",")

matched_ChrII <- subset(matched_df, X.CHROM == "II")
write.table(matched_ChrII, "matched_ChrII.csv", col.names = T, sep = ",")

matched_ChrIII <- subset(matched_df, X.CHROM == "III")
write.table(matched_ChrIII, "matched_ChrIII.csv", col.names = T, sep = ",")

matched_ChrIV <- subset(matched_df, X.CHROM == "IV")
write.table(matched_ChrIV, "matched_ChrIV.csv", col.names = T, sep = ",")

matched_ChrV <- subset(matched_df, X.CHROM == "V")
write.table(matched_ChrV, "matched_ChrV.csv", col.names = T, sep = ",")

matched_ChrX <- subset(matched_df, X.CHROM == "X")
write.table(matched_ChrX, "matched_ChrX.csv", col.names = T, sep = ",")




write.table(matched_df, "matched_df.csv", col.names = T, sep = ",")



