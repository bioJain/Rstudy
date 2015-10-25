corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  a = "/Users/joehalee/R/Coursera_Rprog/"
  b = directory
  full_dir = paste(a, b, sep="")
  setwd(full_dir)
  id_range = sprintf("%03d", 1:332)
  csv_id_range = paste(id_range, "csv", sep=".")
  
  result <- vector(mode="numeric", length=0)
  
  for (i in csv_id_range) {
    file = read.csv(i)
    max_row = nrow(file)
    
    sul = file["sulfate"]
    nit = file["nitrate"]
    
    sul_non_na = !is.na(sul)
    nit_non_na = !is.na(nit)
    result_nrow = sum(!is.na(nit[sul_non_na,]))
    if (result_nrow >= threshold) {
      temp_val = cor(file[, c("sulfate", "nitrate")], use = "complete.obs", method = "pearson")
      result = c(result, (temp_val["sulfate", "nitrate"]))
    }
  }
  return (result)
}

cr <- corr("specdata", 5000)
