## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # set the cached inverse to null
  cachedInvMatrix <- NULL
  
  # we're setting a new matrix
  set <- function(inMat) {
    mat <<- inMat
    cachedInvMatrix <<- NULL
  }
  
  # we're getting the stored matrix
  get <- function() {
    mat
  }
  
  # set the inverse and store it
  setInverse <- function(invMat) {
    cachedInvMatrix <<- invMat
  }
  
  # get our previously stored inverse
  getInverse <- function() {
    cachedInvMatrix
  }
  
  # returns a list of the functions
  list(set = set, 
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
