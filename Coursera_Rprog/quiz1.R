hw = read.csv('hw1_data.csv')

# col names of hw table
names(hw)

nrow(hw)
ncol(hw)
head(hw)
tail(hw)

# find specific value at specific location
hw[47, 'Ozone']

# how many Null value in 'Ozone' col
sum(is.na(hw[, 'Ozone']))

# average value of 'Ozone' col excluding NA
mean(hw[, 'Ozone'], na.rm=TRUE)

# subsetting with condition
subset1 <- subset(hw, Ozone > 31 & Temp > 90, select = c('Solar.R'))
mean(subset1$Solar.R)

subsetJune = subset(hw, Month==6, select=c('Temp'))
mean(subsetJune$Temp)

subsetMay = subset(hw, Month==5, select=c('Ozone'))
max(subsetMay, na.rm=TRUE)
