complete <- function(directory, id = 1:332) {
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  a = "/Users/joehalee/R/Coursera_Rprog/"
  b = directory
  full_dir = paste(a, b, sep="")
  setwd(full_dir)
  id_range = sprintf("%03d", id)
  csv_id_range = paste(id_range, "csv", sep=".")
  
  nobs <- id * c(0)
  id_csv <- c(1:length(id))
  total = data.frame(matrix(c(id, nobs), nrow = length(id), ncol = 2))
  names(total) <- c("id", "nobs")
  row_num = 1
  for (i in csv_id_range) {
    file = read.csv(i)
    max_row = nrow(file)
    sul = file["sulfate"]
    nit = file["nitrate"]
    sul_non_na = !is.na(sul)
    both_non_na = sum(!is.na(nit[sul_non_na,]))
    total[row_num, 2] = both_non_na
    row_num = row_num + 1
    }
  return (total)
}

