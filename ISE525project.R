library("rsm")
library("datasets")

## Useful Help
?rsm
?data.frame
?subset  # Used in first-order modeling to take only factorial rows
browseVignettes('rsm')

##  Import coded data
E2 <- read.csv(file = "C:/Users/kraus_000/Documents/R/Datasets/E2.csv", 
               header = TRUE, 
               sep = ",", 
               dec = ".")  # Reads Data from data repository
E2  # Display raw data.frame
names(E2)  # Show the column names for inputted data

##  Raw Data to RSM Model
CO <- as.coded.data(E2, 
                    x1 ~ 4380 + (a  * 0.05 * 1500),
                    x2 ~ 395  + (b  * 0.05 * 220),
                    x3 ~ 265  + (c  * 0.05 * 220),
                    x4 ~ 75   + (d  * 0.05 * 50),
                    x5 ~ 1600 + (e  * 0.05 * 700),
                    x6 ~ 61   + (f  * 0.05 * 60), 
                    block = 'Blocks')
CO  # Display RSM Model in uncoded terms
truenames(CO)  # Display uncoded names
names(CO)  # Display coded names

## Create First Order Model
CO.rs1 <- rsm(Y ~ Blocks + FO(x1, x2, x3, x4, x5, x6),  # Create first-order model with all 6 variables
              data = CO,  # 
              subset = 1:40)
summary(CO.rs1)

## Create Second Order Model
CO.rs2 <- rsm(Y ~ SO(x1,x2,x3,x4,x5,x6),
              data = CO)
summary(CO.rs2)

ccd.pick(6, n.c = c(8, 16, 32), blks.c = c(0,1,2,3,4), wbr.s = 1:4, restrict = "N<=65" )

B <- matrix(c(
  .000022, 0, 0, 0, 0,
  0, .003287, 0, .003345, -.000254, 
  0, 0, .001594, 0, 0,
  0, .003345, 0, 0, 0,
  0, -.000254, 0, 0, .000440), 
  nrow = 5,
  ncol = 5,
  byrow = T)
# B
b = matrix(c(-.194, -2.260, -.799, -2.49, -1.192), 
           nrow = 5,
           ncol = 1,
           byrow = T)
# b











B.inverse <- solve(B)
# B.inverse
x.s = -.5 * (B.inverse %*% b)
# x.s
B.eigen <- eigen(B)
# B.eigen$val
# B.eigen$vec

x.s_yhat <- 2104 +  t(x.s)%*%b + t(x.s)%*%B%*%x.s
x.s_yhat






