
pollutantmean <- function(directory, pollutant, id=1:332) {
  a = "/Users/joehalee/R/Coursera_Rprog/"
  b = directory
  full_dir = paste(a, b, sep="")
  setwd(full_dir)
  total <- vector()
  id_range = sprintf("%03d", id)
  csv_id_range = paste(id_range, "csv", sep=".")
  for (i in csv_id_range){
    file = read.csv(i)
    pollute = file[pollutant]
    pollute_nna = pollute[!is.na(pollute)]
    total = c(total, pollute_nna)
  }
  mean_poll = mean(total)
  return (mean_poll)
}
