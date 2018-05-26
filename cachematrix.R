## The first function, `makeCacheMatrix` creates a list containing 4 functions to

## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  set the value of the inverse of matrix
## 4.  get the value of the inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  get <- function() x
  set <- function(y) {
       x <<- y
       i <<- NULL
  }
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}


## The following function calculates the inverse of the input matrix in 
## 'makeCacheMatrix'. However, it first checks to see if the
## inverse has already been calculated. If so, it `get`s the inverse from the
## cache and skips the computation. Otherwise, it calculates the inverse of
## the data and sets the value of the inverse in the cache via the `setinverse`
## function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data,...)
  x$setinverse(i)
  i
}
