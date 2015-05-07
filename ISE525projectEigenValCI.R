require('rsm')
?rsm

# Import Design matrix and response column
data <- read.csv(file = "C:/Users/kraus_000/Documents/R/Datasets/E3_DY.csv")
data
E3 <- as.data.frame(data)
E3
names(E3)
# Returns [1] "A" "B" "C" "D" "E" "F" "Y", I need the A, B, C, E, F in the design matrix, and Y in the response vector

D.full <- data.matrix(frame = E3[,c(1:6)])
X.full <- cbind(1, D.full)
C.full <- solve(t(X.full) %*% X.full)
C.full

# Extract columns of the data frame corresponding to design table
D <- data.matrix(frame = E3[,c(1:3,5,6)])
D


# Add intercept column to design matrix to form X matrix
X <- cbind(1, D, D[,1]^2, D[,2]^2, D[,3]^2, D[,4]^2, D[,5]^2, D[,6]^2, D[,2]*D[,5], D[,3]*D[,5], D[,3]*D[,6])
X
colnames(X)[c(1,8,9,10,11,12,13,14,15, 16)] <- c("I", "AA", "BB", "CC", "DD", "EE", "FF", "BE", "CE", "CF")
X

C <- solve(t(X) %*% X)  # Solve for the variance-covariance matrix, just for reference
C


# Extract response column Y
Y <- data.matrix(frame = E3[,7])
Y

# Regression Equation from Minitab in uncoded units 
# Y = 2779 - 0.2082 A - 4.179 B - 1.324 C - 1.596 E + 0.403 F + 0.000023 A*A + 0.004412 B*B + 0.001247 C*C + 0.000415 E*E - 0.00929 F*F + 0.000507 B*E + 0.000348 C*E + 0.00307 C*F

# Assign variables based on equation
b0 <- matrix(c(2779))
b0
b <- matrix(c(-0.2082,
              -4.179,
              -1.324,
              -1.596,
              0.403),
            nrow = 5, ncol = 1, byrow = T)
b
B <- matrix(c(  0.000023,         0,         0,         0,         0,
                       0,  0.004412,         0, 0.0002535,         0,
                       0,         0,  0.001247,  0.000174,  0.001535,
                       0, 0.0002535,  0.000174,  0.000415,         0,
                       0,         0,  0.001535,         0,  -0.00929),
             nrow = 5, ncol = 5, byrow = T)
B


B.inverse <- solve(B) # B^-1
B.inverse  # Print B inverse matrix
x.s = -.5 * (B.inverse %*% b) # stationary point
x.s  # Print stationary point

B.eigen <- eigen(B)  # Eigenvalue analysis
B.eigen$val  # Print eigenvalues: [1]  0.004428054  0.001493035  0.000372033  0.000023000 -0.009509121
B.eigen$vec  # Print eigenvector
# [,1]        [,2]        [,3] [,4]          [,5]
# [1,] 0.0000000000  0.00000000  0.00000000    1  0.000000e+00
# [2,] 0.9979940703 -0.01343475  0.06186551    0 -4.513954e-05
# [3,] 0.0036543147  0.97801096  0.15333210    0 -1.413169e-01
# [4,] 0.0632005889  0.15469651 -0.98593536    0  2.478868e-03
# [5,] 0.0004089044  0.13922304  0.02435976    0  9.899613e-01

# As seen above, all eigenvalues are positive besides the last one. This Eigenvalue is very small, and may not be significantly different from zero, indicating a global minimum at this stationary point. We can test by computing the confidence intervals on that eigenvalue. We need the MSe from the fitted surface. It is found from Minitab analysis of the second-order model.

# Fit the a-canonical model Y.hat = a_0 + u'*a + u'*Lambda*u, which is the original model rotated but not translated to the stationary point.
# a = P'b, P is the eigenvector matrix from canonical analysis
P <- B.eigen$vec

# U matrix is design points in natural units with coordinates rotated by P matrix: U = D*P
U <- D %*% P
U

#Create a-canonical X matrix by adding a column of 1's to the a-canonical design table
a.X <- cbind(1, U)
a.X

# Fit first order model b'P
a <- t(b) %*% P
a

# standard error estimate for eigenvalue j is sqrt(MSE * C(j,j))
# compute variance covariance matrix from a-canonical X matrix
a.C <- solve(t(a.X) %*% a.X)
a.C

# C(j,j) for eigenvalue 5 is C[6,6]
MSe <- 3.575
j <- 6

a.se.j <- sqrt(MSe * a.C[j,j]) 
a.se.j

B.eigen$val[j-1]  # Prints [1] -0.009509121

# t(alpha/2, n-p) is t(.025, 92 - 14) ~ t(.025, 75) = 1.990
t.pm <- c(-1.990, 1.990)
CI <- B.eigen$val[(j-1)] + a.se.j*t.pm
CI

B.eigen$val + a.se








