##  Import coded data
inputX.d<- read.csv(file = "C:/Users/kraus_000/Documents/R/Datasets/E2_fX.csv", 
               header = TRUE, 
               sep = ",", 
               dec = ".")  # Reads Data from data repository

## Creating matricies from frames
?data.matrix
X.d <- data.matrix(inputX.d)
X.d



