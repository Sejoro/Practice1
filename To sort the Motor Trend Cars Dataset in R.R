library(datasets)
head(mtcars)

library(plyr)

## To sort the data frame by cyl and mpg
## use 'plyr::arrange()


arrangedData <- arrange(mtcars, cyl, mpg)
arrangedData

arrangedData1 <- arrange(mtcars, disp, hp)

## order() can also be used to do the
## same thing, sort mtcars by cyl and mpg

orderedData <- mtcars[order(mtcars$cyl, mtcars$mpg),]

## To make the output of arrange() to include the rownames
library(datasets)
library(plyr)

## move rownames to a column, because plyr::arrange() does 
## not work with rownames

carName <- rownames(mtcars)
mtcars <- cbind(carName, mtcars)
rownames(mtcars) <- NULL
head(mtcars)

## Now, let sort the dataset using arrange() like before

arrangedData2 <- arrange(mtcars, cyl, mpg)

