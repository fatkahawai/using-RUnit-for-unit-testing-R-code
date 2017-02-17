#
# my example recursive function
#
# run in RSTuido like this:
# > source("recursive example.R")
# > padVector(c("abc","def"),3)
# [1] "abc", "def", "def"
#
# s - a vector of strings
# len - the length of string you want to create by padding
#
padVector <- function(s, len) {

# validation
#
	if( length(s) <= 0 || len <= 0) { 
		"empty arg"
	}
	else if( length(s) >= len ) {   # or nchar if you want number of chars in each string element in the vector,       
		s
	}
	#
# once args validated, first make sure you define an ESCAPE from recursion when you reach your goal !
#
	else if (length(s) >= len) {
		s   # return the completed string
	}
	else {
#
# landing here means you are not finished, so now perform the action and 
# increment/decrement the variable triggering escape clause before calling recursively
# WARNING: Make sure that the increment/decrement brings you closer to the escape clause ! 
#
		s <- c(s,s[length(s)]) # append a copy of the last vector element

# and call the function again
		padVector(s, len)
	}
}