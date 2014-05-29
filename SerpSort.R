#Create random data
set.seed(1)
Var1 <- sample(1:67, 1000, replace=T)
Var2 <- sample(1:5, 1000, replace=T)
Var3 <- sample(1:4, 1000, replace=T)
FakeData <- data.frame(Var1, Var2, Var3)

#Replace Var3==4 with missing data
FakeData$Var3[FakeData$Var3 == 4] <- NA

#Create a dummy variable for Var2 that is negative for every other by group of Var1
FakeData$Dummy <- FakeData$Var2 * (-1)^(Var1 %% 2)

#Sort the data frame on Var1 and Dummy variables
FakeData <- FakeData[order(FakeData$Var1, FakeData$Dummy),]
