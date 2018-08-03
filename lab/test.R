library("caret")
test1 <- read.csv("test_data.csv")

test1 <- subset(test1, select = -sponsor)
test1 <- subset(test1, select = -no_private)
test1 <- subset(test1, select = -date)
test1 <- subset(test1, select = -recorder)
test1 <- subset(test1, select = -e_type)
test1 <- subset(test1, select = -e_type_grp)
test1 <- subset(test1, select = -fee_type)
test1 <- subset(test1, select = -source)
test1 <- subset(test1, select = -quantity_grp)
test1 <- subset(test1, select = -type_grp)
test1 <- subset(test1, select = -permit)
test1 <- subset(test1, select = -meeting)

test1[test1=='unknown'] <- NA
test1[test1==''] <- NA
test1[test1==0] <- NA