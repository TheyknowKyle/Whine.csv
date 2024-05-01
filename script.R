rm(list = ls())

library(Hmisc)

kill_data <- read.csv("C:/Users/Boss K/Desktop/Data_Match_Kills/kill_match_stats_final.csv")

print("Summary statistics of the kill data:")
print(describe(kill_data))

print("Summary statistics for killer placement:")
print(summary(kill_data$killer_placement))
print("Summary statistics for victim placement:")
print(summary(kill_data$victim_placement))

kill_data$solo_kill <- ifelse(kill_data$killer_name == kill_data$victim_name, 1, 0)

print("Summary statistics of the 'solo_kill' column:")
print(summary(kill_data$solo_kill))

solo_kills <- sum(kill_data$solo_kill == 1)
print(paste("Number of solo kills:", solo_kills))

solo_kill_percentage <- solo_kills / nrow(kill_data) * 100
print(paste("Percentage of solo kills:", solo_kill_percentage))

total_kills <- nrow(kill_data)
print(paste("Total number of kills:", total_kills))

average_kills_per_match <- total_kills / length(unique(kill_data$match_id))
print(paste("Average number of kills per match:", average_kills_per_match))
