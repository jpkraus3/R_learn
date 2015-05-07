B <- matrix(c(  # B matrix computed from Minitab fitted second-order model
  .000023, 0, 0, 0, 0,
  0, .004412, 0, .0002535, 0, 
  0, 0, .001247, .000174, .001535,
  0, .0002535, .000174, .000415, 0,
  0, 0, .001535, 0, -.00929), 
  nrow = 5,
  ncol = 5,
  byrow = T)
B
b = matrix(c(-.2082, -4.179, -1.324, -1.596, .403), # b matrix from Minitab fitted model
           nrow = 5,
           ncol = 1,
           byrow = T)
b
B.inverse <- solve(B) # B^-1
B.inverse  # Print B inverse matrix
x.s = -.5 * (B.inverse %*% b) # stationary point
x.s  # Print stationary point

B.eigen <- eigen(B)  # Eigenvalue analysis
B.eigen$val  # Print eigenvalues
B.eigen$vec  # Print eigenvectors

x.s_yhat <- 2779 +  t(x.s)%*%b + t(x.s)%*%B%*%x.s  # Estimated response at stationary point
x.s_yhat  # Print estimated response
