## To unzip a file

unzip("diet_data.zip", exdir = "diet_data")

## To get a list of files in our folder "diet_data"

list.files("diet_data")

## To look at one of the files, let's say "David"

david <- read.csv("diet_data/David.csv")
head(david)

## To get the number of rows in our file; look at the length of the Age column

length(david$Age)

## We can also get the rows and the columns as well by looking at the dimension of the dataframe

dim(david)

## To get a feel for a new data file, run these commands 'str()', 'summary(), and 'names()'
str(david)

## To get the mean, median, minimum, maximum i.e. summary of the dataset

summary(david)

## To get the names of the column headers

names(david)

## To see David's starting weight(the first row of the weight column)
david[1, "Weight"]

## Alternatively

david[1, 3]

## To see the content of david
View(david)

## To get David's weight on day 15

david[15, "Weight"]

## Alternatively, we could create a subset of the "Weight" column where 'Day' is equal to 30

david[which(david$Day == 15), "Weight"]

## Alternatively

subset(david$Weight, david$Day == 15)
?subset

## To find out how much weight he lost by subtracting the vectors. Lets assign David's starting and 
## ending weight to vectors

## David's starting weight

david_start <- david[1, "Weight"] 

## David's ending weight

david_end <- david[30, "Weight"]

## David's weight lose

Weight_Lose <- david_start - david_end
Weight_Lose

## To store the outputs of list.files() in a file

files <- list.files("diet_data")

## Since "files" is now a list of the contents of 'diet_data' in alphabetical
## order, we can call a specific file by subsetting it

files[1]
files[3]
files[-1]

## To look at a file in our files, we need to first write the code below

files_full <- list.files('diet_data', full.names = T)

## Then, we can now call the file we want to look at by write the code below with the 
## index of the file

head(read.csv(files_full[4]))


View(david)
AD_frame <- rbind(david, read.csv(files_full[1]))
AD_frame
## To get the 25th Day for David and Andy

AD_frame[which(AD_frame$Day == 25),]

## Alternatively,

subset(AD_frame$Age, AD_frame$Day == 25)

## To use for loop to create dataframe, first create an empty dataframe to store 
## our data

data <- data.frame()
for (i in 1:5) {
        data <- rbind(data, read.csv(files_full[i]))
}

str(data)

View(data)

## To get the median weight for all the data

median(data$Weight, na.rm = T)

## To get the median weight of day 30, first get the data of day 30

day_30 <- data[which(data[, "Day"] == 30),]

## Then, median weight

median(day_30$Weight, na.rm = T)

## To build a function that will return the median weight of a given day

weightmedian <- function(directory, day) {
        # Create a list of files
        files_list <- list.files(directory, full.names = TRUE)
               
        data <- data.frame() ## create an empty dataframe
        
        for (i in 1:5) {
                # loop through the files and rbind them together
                data <- rbind(data, read.csv(files_list[i]))
                
        }
        ## Subset the rows that match the 'day' argument
        data_subset <- data[which(data$Day == day),] ## or data_subset <- data[which(data[, "Day"] == day),]
        ## Calculate the median weight of the data_subset while striping out the NAs
        median(data_subset$Weight, na.rm = T) ## or median(data_subset[, "Weight"], na.rm = T)
}

## To test our function

weightmedian("diet_data", 10)

weightmedian("diet_data", 15)

weightmedian("diet_data", 24)
weightmedian("diet_data", 20)

## To build a function that will return the mean age of a given day
mean_age <- function(directory, day) {
        files_list <- list.files(directory, full.names = TRUE)
        # Create a list of files
        
        data <- data.frame() ## create an empty dataframe
        
        for (i in 1:5) {
                # loop through the files and rbind them together
                data <- rbind(data, read.csv(files_list[i]))
                
        }
        ## Subset the rows that match the 'day' argument
        data_subset <- data[which(data[, "Day"] == day),]
        ## Calculate the mean age of the data_subset while striping out the NAs
        mean(data_subset[, "Age"], na.rm = T)
}
mean_age("diet_data", 24)

day_30 <- data[which(data$Day ==  30),]

median(day_30$Weight, na.rm = T)

files_full ## this contains all our files(data) in .csv format

summary(files_full)
## Another approach to calculating the weight of a given day

tmp <- vector(mode = "list", length = length(files_full))
summary(tmp)

## Now, we read in those csv files and drop them in 'tmp'

for (i in seq_along(files_full)) {
        tmp[[i]] <- read.csv(files_full[[i]])
}

tmp
str(tmp[[1]])
head(tmp[[1]] [, "Day"])

## Alternatively, those files in files_full can also be read and stores as below
data2 <- lapply(files_full, read.csv)
data2


x <- 1:4
lapply(x, runif, min = 0, max = 10)

z <- list(a = matrix(1:4, 2,2), b = matrix(1:6, 3,2))
z

## To extract the first column of each matrix above
lapply(z, function(elt) elt[, 1])

## To extract the second column of each matrix above
lapply(z, function(elt) elt[, 2])

sapply(z, mean)
