#Create a data frame titled Serp
v1 <- c(1, 2, 3, 1, 2, 3, 1, 2, 3)
v2 <- c(1, 1, 1, 2, 2, 2, 3, 3, 3)
serp <- data.frame(v1, v2)
#Sort the data frame tited Serp on the first group, v1
serp <- serp[order(v1),]
#Method for serpentine is to multiply the variable you want to serpentine 
#sort on by (-1) raised to the power of the first by group so v2*(-1)^v1
serp$v3 <- serp$v2 * (-1)^serp$v1 
#finally sort on v1 by v3 and the v2 variable will contain a serpentine sort
FinalSerp <- serp[order(serp$v1, serp$v3),]
