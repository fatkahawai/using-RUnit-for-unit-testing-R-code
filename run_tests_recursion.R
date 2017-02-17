# ----------------------------------------------------------------------------
# @description
# 
# Testing using RUnit
#
# to run unit tests, run this script, which will run your unit src then run all 
# the 'runit_*.R" test scripts RUnit finds in the 'tests' directory 
#
# @version 1.0
# @author Ceeb
# (C)Fatkahawai 2016
# ----------------------------------------------------------------------------
# Tailor this for your project

myProjectDir <- "using RUnit"			# folder within 'projects' folder where the src file and test script is
myUnitFile <- "recursive example.R" # the name of the unit src file we are testing
myTestFile <- "run_tests_recursion.R" # the name of the test script to run

myRoot <- file.path("~","dev","R","projects")

projectPath <- file.path(myRoot,myProjectDir)

myCurrentDir <- getwd()
setwd(projectPath)

# ----------------------------------------------------------------------------
# Generic from here - use unchanged for any project

library(RUnit)

message("running source script ", myUnitFile, " in ", projectPath)

if(!file.exists(myUnitFile)){ 
	message("can't find source file")
}
source(myUnitFile) 
message("source script completed")

testDir <- file.path(projectPath,"tests")

message("Now running RUnit test suite - runs all 'runit_*.R' test scripts found in directory ", testDir)

suite <- defineTestSuite("recursion suite", testDir)

testResult <- runTestSuite(suite)
message("test suite completed")
printTextProtocol(testResult)

## Return success or failure to R CMD CHECK
if (getErrors(testResult)$nFail > 0) {
   stop("TEST FAILED!")
}
if (getErrors(testResult)$nErr > 0) {
   stop("TEST HAD ERRORS!")
}
if (getErrors(testResult)$nTestFunc < 1) {
   stop("NO TEST FUNCTIONS RUN!")
}

setwd(myCurrentDir)