## read the dataset and store it as 'hospital_df'
hospital_df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")


## Write a function called rankall that takes two arguments: an outcome name (outcome) and a hospital ranking (num). The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame containing the hospital in each state that has the ranking specified in num. For example the function call rankall("heart attack", "best") would return a data frame containing the names of the hospitals that are the best in their respective states for 30-day heart attack death rates. The function should return a value for every state (some may be NA). The first column in the data frame is named hospital, which contains the hospital name, and the second column is named state, which contains the 2-character abbreviation for the state name. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.
## Handling ties. The rankall function should handle ties in the 30-day mortality rates in the same way that the rankhospital function handles ties.

## Read outcome data
## Check that state and outcome are valid
## For each state, find the hospital of the given rank
## Return a data frame with the hospital names and the
## (abbreviated) state name
rankall <- function(outcome, num = "best") {
  states <- levels(factor(hospital_df[, "State"]))
 
  if (outcome == "heart attack") {
    lookupcol = 11
  } else if (outcome == "heart failure") {
    lookupcol = 17
  } else if (outcome == "pneumonia") {
    lookupcol = 23
  } else {    
    stop("invalid outcome")
  }
  
  index <- 1
  st_vec <- vector()
  rank_vec <- vector()
  for (st in states) {
    state_hp <- subset(hospital_df, State == st, select = c(2, lookupcol))
    state_hp[, 2] <- as.numeric(state_hp[, 2])
    sort_index <- order(state_hp[, 2], state_hp[, 1])
    sorted_hp <- state_hp[sort_index, ]
    st_vec[index] <- st
    if (num == "best") {
      rank_vec[index] <- sorted_hp[1, 1]
      index <- index + 1
    } else if (num == "worst") {
      rowindex = sum(!is.na(sorted_hp[, 2]))
      rank_vec[index] <- sorted_hp[rowindex, 1]
      index <- index + 1
    } else {
      rank_vec[index] <- sorted_hp[num, 1]
      index <- index + 1
    }
  }
  result <- data.frame(hospital = rank_vec, state = st_vec, row.names = st_vec)
  return(result)
}
