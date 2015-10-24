## Author: NgGmzR || Date: 2015-10-23
## These functions create a list of functions to retunr the inverse
## of a matrix, and validate if the calculation is cached

## 1/2 Creates a functions definition to set a matrix and its inverted
## and make the calculation available in cache
makeCacheMatrix <- function(x = matrix()) {
    
    # function body
    im <- NULL
    set <- function (y){
        x <<-y
        im <<-NULL
    }
    get <- function (){
        x
    }    
    setmtx <- function(solve){
        im<<-solve(x)
    }
    getmtx <- function(){
        im
    }
    list(set=set, get=get,
         setmtx=setmtx,
         getmtx=getmtx)
    # end of function
}

## 2/2 Inverts the content of a Matrix if neccesary otherwise it gets
## from the cache
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    # function body
    im<-x$getmtx()
    
    if(!is.null(im)) {
        message("Getting Cached data")
        return(im)
    }
    
    matriz <- x$get()
    im <- solve(matriz, ...)
    x$setmtx(im)
    im
    # end of function
}
