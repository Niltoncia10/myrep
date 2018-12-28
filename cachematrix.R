## These functions cache the inverse of a matrix

## creates a special matrix object that caches its inverse

makeCacheMatrix <- function(x = matrix()) {
ivs<-NULL
set<-function(y){
  x<<-y
  ivs<<-NULL
}
get<-function() x
setIvs<-function(inverse) ivs<<-inverse()
getIvs<-function() ivs
list(set=set,get=get,setIvs=setIvs,getIvs=getIvs)
}


## calculates the inverse of matrix returned by the function above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
ivs<-x$getIvs()
if(!is.null(ivs)){
  message("getting cached data")
  return(ivs)
}
m<-x$get()
ivs<-solve(m,...)
x$setIvs(ivs)
ivs
}
