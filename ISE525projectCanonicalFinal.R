# Import Design matrix and response column
DesignData <- read.csv(file = "C:/Users/kraus_000/Documents/R/Datasets/E3_design_coded.csv")
#DesignData
#names(DesignData)

# Extract columns of the data frame corresponding to design table
D <- data.matrix(frame = DesignData[,c(1:6)])
#D

# Extract response column Y
Y <- data.matrix(frame = DesignData[,7])
#Y

X <- cbind(1, D)
#X
C <- solve(t(X)%*%X)
#C

# Open Coefficient CSV
CoeffData <- read.csv(file = "C:/Users/kraus_000/Documents/R/Datasets/E3FewerInteraction_coefficients.csv",)
#CoeffData

# Assign variables from coefficient data frame
b0 <- CoeffData$Coef[1]
#b0
b <- matrix(CoeffData$Coef[2:7])  # Extracts the rest of the rows, variable length for different models
#b

# Open Beta matrix CSV
Beta.Mat <- read.csv(file = "C:/Users/kraus_000/Documents/R/Datasets/E3FewerInteraction_Bmatrix.csv")
B <- data.matrix(frame = Beta.Mat)
#B
B.inverse <- solve(B) # B^-1
#B.inverse  # Print B inverse matrix
x.s = -.5 * (B.inverse %*% b) # stationary point
x.s  # Print stationary point

y.hat <- b0 + t(x.s) %*% b + t(x.s) %*% B %*%x.s
y.hat  # Print estimated response at stationary point, 99.09924

B.eigen <- eigen(B)  # Eigenvalue analysis
B.eigen$val  # Print eigenvalues: 2.5314726  1.7621265  0.6307434  0.5580000 -0.3413425  0.0840000
