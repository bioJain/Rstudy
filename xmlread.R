# get the 'xml' file from url
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml', destfile = 'quiz1_test.xml', method = 'curl')

# open the xml file
doc <- xmlTreeParse('quiz1_test.xml', useInternalNodes = TRUE)

# get the structure of the xml file
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]

# how many zipcodes are '21231' ?
zips <- xpathSApply(rootNode, '//zipcode', xmlValue)
sum(zips == '21231')
