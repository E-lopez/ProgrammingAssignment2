##Trough the function 1 (makeCacheMatrix), we can store certain values in it큦 environment.
##Function 2 (cacheSolve), let us access those stored values and return them
##when existent. Otherwise, function 2 would calculate them and function 1 will store them.

makeCacheMatrix <- function(x = matrix()) {  ##takes as input a matrix, coded as 'x', 
                                             
     
       m <-NULL     ##and stores it큦 outputs in the vector 'm'.
      
     set.values <- function(y){              
                                            ##set.values() let us modify the value stored on vector m.
                              x <<- y       ##Useful in case we want to reset the stored values.
                              m <<- NULL
                        }

 
             get.values <- function() x   ##prints the input of the main function (makeCacheMatrix).
     set.inverse.matrix <- function(inverse.matrix) m <<- inverse.matrix   ##Store a calculated inverse matrix in 'm'.
     get.inverse.matrix <- function() m   ##fetches the inverse matrix for a given matrix stored on vector m.
     
      
            list(set.values = set.values, 
                  get.values = get.values,                    ## This list will store the four functions 
                  set.inverse.matrix = set.inverse.matrix,    ##so we can call them from a different
                  get.inverse.matrix = get.inverse.matrix)    ##environment.
      }


##This function uses data stored in function 1 by calling it큦 functions. 

cacheSolve <- function(x, ...) {  ##It큦 input is an object where function 1 is stored: a<-makeCacheMatrix(x). 
       
      m <- a$get.inverse.matrix()                  ##Calls 'get.inverse.matrix()' from function 1
                                                   ##to check if the inverse matrix allready exists.
            if(!is.null(m)) {
                  message("Fetch from cache")     ##If it does, prints a message and returns cached value in 'm'.
                  return(m)                       
            }
                                                     
      matrix <- a$get.values()                       ##Otherwise, uses 'solve()' to calculate it from 'get.values()',
            inverse <- solve(matrix)                 ##stores the resultant matrix using 'set.inverse.matrix()'
                  a$set.inverse.matrix(inverse)      ##in the vector 'm' from function 1,
            
                        return(inverse)              ##and returns calculated matrix.
            }
