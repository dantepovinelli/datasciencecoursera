#intro to writing functions

#write a function named add2, with 2 arguments x and y, the bit in curly braces
#tells R that the function should add the two arguments
add2 <- function(x, y) {
  x+y
}
#lets try it:
add2(2,2)


#now lets write a function which takes a vector of numbers and returns a vector
#containing only the subset of elements greater than 10
above10<-function(vec) {
  use <- vec>10 
  #creates a logical vector where the TRUE's will be used in the function output
  vec[use]
}
#lets try it out. I'l create a vector by  sampling 20 integers between 1 and 35
vec<-sample(seq(1,35), 20)
above10(vec)

#to extend this, lets make it a two argument function which subsets above a 
#given number x
abovex<- function(vec, x){
  use<-vec>x
  vec[use]
}
#and we test it again the same way, but with x=8 instead of 10
abovex(vec,8)

#we can also give the function default values. This way R can run it even with 
#unspecified arguments 
abovex<- function(vec, x=10){
  use<-vec>x
  vec[use]
}
#and we can test that this is the new default with the identical function
identical(abovex(vec), abovex(vec,10))

#and now for a more complicated example, we will write a function 
#to calculate mean value in each column of a dataframe or matrix (x); we will 
#use a for loop
columnmean<-function(x){
  #first we make an empty numeric vector (to store col means) with length equal 
  #to the number of columns
  nc<-ncol(x)
  means<-numeric(length=nc)
  
  #the for loop will cycle through each column, assigning the col mean to the 
  #corresponding position in the vector we made
  for(i in 1:nc){
    means[i]<-mean(x[,i])
  }
  means
}

#we can test it on a dataset of airquality
columnmean(airquality)

#notice that the first two column means are NA, because the dataset had NA's
#it is common to have default arguments for removing/ignoring NA's in functions.
#Lets add that option now, with the default set to removing them from the 
#analysis.
columnmean<-function(x,removeNA=TRUE){
  nc<-ncol(x)
  means<-numeric(length=nc)
  for(i in 1:nc){
    #the means function already has an argument for this,
    #so we just pass our function's argument to it and we are done
    means[i]<-mean(x[,i],na.rm=removeNA)
  }
  means
}

#and again we can test it
columnmean(airquality,FALSE)
# with FALSE, the NA's are left in
columnmean(airquality,TRUE)
#with TRUE, the NA's are removed and we get means for all columns
identical(columnmean(airquality,TRUE), columnmean(airquality))
#we wrote the function to assume TRUE by default, so its identical with the 
#argument left blank

#R's lexical scoping rules allow us to define free variables whithin another 
#function;
#for example, this function below will take a power n and output a function that
#raises a number x to that power
make.power<-function(n){
  pow<-function(x){
    x^n
  }
}
#ex:feeding it n=2, n=3 outputs functions for squaring or cubing respectivley
square<-make.power(2)
cube<-make.power(3)
square(3)
cube(3)

#note that n is used by the inner("child") function, 
#but defined by the "parent" function

#to see what is in our function's environment we can use
ls(environment(cube))
#this is a list of the objects in our functions' environments
get("n", environment(cube))
get("n", environment(square))
#see, R has the value of n defined within each environment,



