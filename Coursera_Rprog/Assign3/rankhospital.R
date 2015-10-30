## read the dataset and store it as 'hospital_df'
hospital_df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

## Write a function called rankhospital that takes three arguments: the 2-character abbreviated name of a state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num). The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the ranking specified by the num argument. The num argument can take values “best”, “worst”, or an integer indicating the ranking (smaller numbers are better). If the number given by num is larger than the number of hospitals in that state, then the function should return NA. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.
## Handling ties. It may occur that multiple hospitals have the same 30-day mortality rate for a given cause of death. In those cases ties should be broken by using the hospital name. 

rankhospital <- function(state, outcome, num = "best") {
  if (!(state %in% hospital_df[, "State"])) {
    stop("invalid state")
  }
  
  if (outcome == "heart attack") {
    lookupcol = 11
  } else if (outcome == "heart failure") {
    lookupcol = 17
  } else if (outcome == "pneumonia") {
    lookupcol = 23
  } else {    
    stop("invalid outcome")
  }
  
  state_hp <- subset(hospital_df, State == state, select = c(2, lookupcol))
  state_hp[, 2] <- as.numeric(state_hp[, 2])
  sort_index <- order(state_hp[, 2], state_hp[, 1])
  sorted_hp <- state_hp[sort_index, ]
  
  if (num == "best") {
    print(sorted_hp[1, 1])
  } else if (num == "worst") {
    rowindex = sum(!is.na(sorted_hp[, 2]))
    print(sorted_hp[rowindex, 1])
  } else {
    print(sorted_hp[num, 1])
  }
}
