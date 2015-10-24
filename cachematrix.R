## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x){
  if(!exists("m")) {
    m <<- NULL
  }
    
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  
  setmatrixinverse <- function(solve) m <<- solve
  
  getmatrixinverse <- function() m
  
  list(set = set, get = get,
       setmatrixinverse = setmatrixinverse,
       getmatrixinverse = getmatrixinverse)
}


cacheSolve <- function(x){    
    
  if(exists("m") && !is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  m <- x$getmatrixinverse()
  
  data <- x$get()
  m <- solve(data)
  x$setmatrixinverse(m)
  
  m
}
