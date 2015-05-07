# Import Design matrix and response column
DesignData <- read.csv(file = "C:/Users/kraus_000/Documents/R/Datasets/E3_design_coded.csv")
#DesignData
#names(DesignData)

# Extract columns of the data frame corresponding to design table
D <- data.matrix(frame = DesignData[,c(1:6)])
D

# Extract response column Y
Y <- data.matrix(frame = DesignData[,7])
Y

X <- cbind(1, D)
#X
C <- solve(t(X)%*%X)
C

# Open Coefficient CSV
CoeffData <- read.csv(file = "C:/Users/kraus_000/Documents/R/Datasets/E3_coefficients.csv",)
#CoeffData

# Assign variables from coefficient data frame
b0 <- CoeffData$Coef[1]
b0
b <- matrix(CoeffData$Coef[2:7])  # Extracts the rest of the rows, variable length for different models
b

# Open Beta matrix CSV
Beta.Mat <- read.csv(file = "C:/Users/kraus_000/Documents/R/Datasets/E3_Bmatrix.csv")
B <- data.matrix(frame = Beta.Mat)
B
B.inverse <- solve(B) # B^-1
#B.inverse  # Print B inverse matrix
x.s = -.5 * (B.inverse %*% b) # stationary point
x.s  # Print stationary point

B.eigen <- eigen(B)  # Eigenvalue analysis
B.eigen$val  # Print eigenvalues: [1]  2.53050670  1.78990976  0.69800730  0.57341206 -0.41294301  0.04610719
#B.eigen$vec  # Print eigenvector

# As seen above, all eigenvalues are positive besides the D*D eigenvalue. This Eigenvalue is very small, and may not be significantly different from zero, indicating a global minimum at this stationary point. We can test by computing the confidence intervals on that eigenvalue. We need the MSe from the fitted surface. It is found from Minitab analysis of the second-order model.

# Fit the a-canonical model Y.hat = a_0 + u'*a + u'*Lambda*u, which is the original model rotated but not translated to the stationary point.
# a = P'b, P is the eigenvector matrix from canonical analysis
P <- B.eigen$vec

# U matrix is design points in natural units with coordinates rotated by P matrix: U = D*P
U <- D %*% P
#U

X.a <- cbind(1, U)
C.a <- solve(t(X.a) %*% X.a)
C.a

# Fit first order model b'P
a <- t(b) %*% P
#a

# standard error calculation
MSe <- 3.847  # Read from Minitab output for original model
C.ff <- C[6,6] # C(j,j) for eigenvalue 5 is C[6,6], but CCD is rotatable and main diagonal components of C should be all be equal
se <- sqrt(MSe * C.ff)
se  # Returns .210, Minitab output is .208 for the a-canonical model

B.eigen$val[5]  # Prints [1] -0.412943

# t(alpha/2, n-p) is t(.025, 92 - 27 - 1) ~ t(.025, 80) = 1.990
t.pm <- c(-1.99, 1.99)
CI <- B.eigen$val[5] + se*t.pm
CI

