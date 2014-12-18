#Set up environment 
setwd("/Users/timphan/Desktop/carnival") #set working directory to folder with spreadsheets
install.packages("gdata") #install package that imports Excel docs to R
library(gdata)#load package

#Import Data
spreadsheets<- Sys.glob("*.xlsx") #write character string that pulls up the names of all docs in the directory with the stated extension
data <- lapply(spreadsheets, function(x) read.xls(x, sheet=1, header=TRUE)) #Import all spreadsheets into a list of 12 data frames

#Rename data
spreadsheetnames<- gsub(".xlsx", "", spreadsheets) #find and replace "xlsx" 
names(data) <- spreadsheetnames

#Export data
lapply(1:length(data), function(i) write.csv(data[[i]],
                                             file = paste0(names(data[i]), ".csv"),
                                             row.names = FALSE))

 
