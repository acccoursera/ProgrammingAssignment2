## Needed to modify the basic template to check that 
## the cached object actually exists and to create
## it if it does not

makeCacheMatrix <- function(x){
  # if m does not exist then 
  # we need to create it
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
  ## Check if the data is cached already
  if(exists("m") && !is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  ## only call this function if 
  ## m is not cached already
  m <- x$getmatrixinverse()
  
  data <- x$get()
  m <- solve(data)
  x$setmatrixinverse(m)
  
  m
}
