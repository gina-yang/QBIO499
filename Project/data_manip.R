
# Read in the data frames
col23 <- read.table("GSM2915575_niche-col23.txt")
lsk <- read.table("GSM3330197_LSK-CTRL.counts.txt")
# Sample 1000 cells from lsk set
lsk = sample(lsk, 1000)



# Prune the data frames
col23_rn = rownames(col23)
# Use the rownames of col23 to get genes that are also in lsk
lsk_prune <- lsk[which(rownames(lsk) %in% col23_rn),]
lsk_rn = rownames(lsk_prune)
# Use the rownames of the pruned lsk to get genes that are also in col23
col23_prune <- col23[which(rownames(col23) %in% lsk_rn), ]


# Merge (horizontal)
df <- cbind(col23_prune, lsk_prune)

write.table(df, "TikhonovaData.txt")

