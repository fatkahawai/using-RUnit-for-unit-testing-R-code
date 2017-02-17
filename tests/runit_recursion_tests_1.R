# ----------------------------------------------------------------------------
# @description
# 
# Testing using RUnit
#
# @version 1.0
# @author Ceeb
# (C)Fatkahawai 2016
# ----------------------------------------------------------------------------

library(RUnit)

# checkEquals: Are two objects equal, including named attributes?
# checkEqualsNumeric: Are two numeric values equal?
# checkIdentical: Are two objects exactly the same?
# checkTrue: Does an expression evaluate to TRUE?
# checkException: Does an expression raise an error?

# Naming Convention for test functions:
# test.myfunctionname.myarguments.returns_myreturnvalue

test.padVector.N_3.returns_3 <- function()
{
  expected <- 3
  t <- c(1,2)
  actual <- length(padVector(t, 3))

  checkEqualsNumeric(expected, actual)
}

test.padVector.NULL_3.prints_error <- function()
{
  expected <- "empty arg"
  actual <- padVector(NULL, 3)

  checkEquals(expected, actual)
}

test.padVector.N_0.prints_error <- function()
{
  expected <- "empty arg"
  actual <- padVector("N", 0)

  checkEquals(expected, actual)
}

test.padVector.no_inputs.fails <- function()
{
  checkException(padVector())
}

