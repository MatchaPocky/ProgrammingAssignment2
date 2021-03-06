## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    ## Returns a list containing a function to
    ## 1. set the matrix
    ## 2. get the matrix
    ## 3. set the inverse of the matrix
    ## 4. get the inverse of the matrix
    m <- NULL
    setmatrix <- function(y){
        x <<- y
        m <<- NULL
    }
    getmatrix <- function()x
    setinverse <- function(solve) m <<- solve
    getinverse <- function()m
    list(setmatrix = setmatrix, 
        getmatrix = getmatrix,
        setinverse = setinverse, 
        getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    ## If the inverse has been calculated, gets inverse from cache
    ## And skips computation
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
    ## Otherwise, calculates inverse 
    ## and sets value of inverse in the cache via setinverse function
    data <- x$getmatrix()
    m <- solve(data, ...)
    x$getinverse(m)
    m
}
