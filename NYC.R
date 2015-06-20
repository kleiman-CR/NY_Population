library(dplyr)
library(tidyr)

Projected_Pop <- read.csv("./Data/Projected_Population_2010-2040_-_Total_By_Age_Groups.csv")
proj_pop_wo_total <- Projected_Pop %>% filter(Borough != "NYC Total", Age != "Total")
project <- proj_pop_wo_total %>% # rename("2010" = X2010, "2015" = X2015, "2020" = X2020, 
                                        # "2025" = X2025, "2030" = X2030, "2035" = X2035, "2040" = X2040) %>%
        mutate(Age_5 = ifelse(grepl("^0-", Age),"0", Age)) %>%
        mutate(Age_5 = ifelse(grepl("^5-", Age),"5", Age_5 )) %>%
        mutate(Age_5 = ifelse(grepl("^10-", Age),"10", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^15-", Age),"15", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^20-", Age),"20", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^25-", Age),"25", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^30-", Age),"30", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^35-", Age),"35", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^40-", Age),"40", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^45-", Age),"45", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^50-", Age),"50", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^55-", Age),"55", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^60-", Age),"60", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^65-", Age),"65", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^70-", Age),"70", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^75-", Age),"75", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^80-", Age),"80", Age_5)) %>%
        mutate(Age_5 = ifelse(grepl("^85+", Age),"85", Age_5)) 

project <- project %>% gather(Year, Population, -Age, -Borough, -Age_5) %>% select(-Age)
project <- project %>% mutate (Year = substring(Year, 2))


write.csv(project, file = "./Data/project.csv", row.names = F)
