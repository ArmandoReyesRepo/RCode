
## 1. Can a function find its variables ???? ----------

x_plus_y <- function(x) {
  x + y
}

###  R Session

x<- 3
x_plus_y(5)

##  It will throw an error,  Y object not found.


###  R Session

y<- 7
x_plus_y(5)

##  It will give a result,  Y object  found, result 12.


###  R Session


x_plus_y(5)

## It will throw an error,  Y object not found.


## 2. Can you access variables from inside functions ? -------

x_plus_y <- function(x) {
  x + y
}
y <- 7
x_plus_y(5)


## 

print(x)

##  It will throw an error. Variable x doesn´t exist outside function.

print(x+y)

##  It will throw an error. Variable x doesn´t exist outside function.

print(y)

## It will print the 7.

## 3. Variable precedence 1  -------

x_plus_y <- function(x) 
  {
  y <- 3
  x + y
}
y <- 7

##  if you call this

x_plus_y(5)

##  The result is 8.  It will take the variable from within function.


## 4. Variable precedence 2  -------

x_plus_y <- function(x) {
  x <- 6
  y <- 3
  x + y
}
y <- 7

## if you call

x_plus_y(5)

##  The result is 9, it will take the variables from within the function.

