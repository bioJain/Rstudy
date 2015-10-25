## These are a pair of functions that cache the inverse of a matrix
## to reduce repeated computation. 

## makeCacheMatrix creates a "matrix" object
## that caches its inverse.
## : set and get the matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)  
}


## cacheSolve computes the inverse of the "matrix" 
## returned by makeCacheMatrix function. 
## If the inverse of the given matrix has already been computed, 
## then the function calls the inverse from the cache.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m  
}
