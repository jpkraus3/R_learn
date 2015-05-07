# Vectors
a <- c(1,2,3,6,-2,4) # numerical vector
b <- c("one", "two", "three") # character vector
c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE) #logical operator
library(rsm)

### Existing dataset with variables on actual scale

CR <- coded.data (ChemReact, x1 ~ (Time - 85)/5, x2 ~ (Temp - 175)/5)
CR                            # same as print(CR, decode = TRUE)
print(CR, decode = FALSE)     # similar to as.data.frame(CR)
code2val (c(x1=.5, x2=-1), codings = codings(CR))

### Existing dataset, already in coded form
codata
CO <- as.coded.data(codata, x1 ~ (Ethanol - 0.2)/0.1, x2 ~ A.F.ratio - 15)
CO
truenames(CO)
names(CO)
