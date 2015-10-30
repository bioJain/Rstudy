## read the dataset and store it as 'hospital_df'
hospital_df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

## 'best' takes two arguments: the 2-character abbreviated name of a state and an outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.
## Handling ties. If there is a tie for the best hospital for a given outcome, then the hospital names should be sorted in alphabetical order and the first hospital in that set should be chosen (i.e. if hospitals “b”, “c”, and “f” are tied for best, then hospital “b” should be returned)

best <- function(state, outcome) {
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
  min_value <- min(state_hp[, 2], na.rm = TRUE)
  hp_names <- subset(state_hp, state_hp[, 2] == min_value, select = 1)
  print(min(hp_names[, 1]))
}
