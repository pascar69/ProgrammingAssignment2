## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## N.B.: assuming that the matrix supplied is always invertible.

makeCacheMatrix <- function(m = matrix()) {
    mm <<- m
    im <<- solve(m)
}



## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has NOT changed) 
## then the cache solve should retrieve the inverse from the cache.
## N.B.: assuming that the matrix supplied is always invertible.

cacheSolve <- function(m, ...) {
    message(m)
    message(mm)
    message(!is.null(im))
    message(identical(m, mm))
    
    if(!is.null(im) && identical(m, mm)) {
        message("getting cached data")
        return(im)
    }
    
    message("calculate and cache data")
    im <- makeCacheMatrix(m)
    im
}


## examples of use
m <- matrix(c(1:4), nrow=2)  ## creating a matrix 2x2
im <- makeCacheMatrix (m)  

cacheSolve(m)   ## getting cached data

im <- NULL   ## erasing im if exist
cacheSolve(m)   ## calculate the transpose (im not cached)

m <- matrix(5:8, nrow=2)  ## changing the matrix
cacheSolve(m)   ## calculate the transpose (m is changed!)

