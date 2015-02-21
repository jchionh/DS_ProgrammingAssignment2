## Put comments here that give an overall description of what your
## functions do

## we have 2 functions here
# makeCacheMatrix is a function that makes special object 
# that has accessor functions to get set the original matrix
# and get set the inverse matrix

# cacheSolve takes in the special object created by makeCacheMatrix
# it first checks if the object already has a precomputed inverse
# if yes, it'll just use it
# if no, it'll compute the inverse, store it, and then returns it

## Write a short comment describing this function
# This function simply creates a list of functions that can
# cache a matrix and the inverse.
# the matrix can be retrived or set by get, set
# the inverse can be retrieved or set by getInverse, setInverse
makeCacheMatrix <- function(mat = matrix()) {
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
# this function operates on the special object created from
# makeCahceMatrix
# if the inverse of the matrix is already, set, we just return it
# else, we calculate the matrix then store it, and return it
# IMPORTANT: if the inverse is already cache, we'll just TRUST
# that the inverse is correct.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  # let's first check x to see if we already have an inverse
  # here, we TURST that the cached inverse is correct
  invMat <- x$getInverse()
  
  # if we've already got a value, use it
  if (!is.null(invMat)) {
    message("using cached value")
    return(invMat)
  }
  
  # if we're here, there's no cached value
  # compute it
  origMat <- x$get()
  invMat <- solve(origMat) %*% origMat
  
  # cache it
  x$setInverse(invMat)
  
  # return it
  return(invMat)
}
