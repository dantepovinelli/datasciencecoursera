hw1_data <- read.csv("~/Desktop/R Working Directories/Coursera course/datasciencecoursera/Raw Data/R Coding/Module 1/hw1_data.csv")

oz<-hw1_data$Ozone
bad<-is.na(oz)
length(hw1_data$Ozone)-length(oz[!bad])
mean(oz[!bad])

newdata<-hw1_data[(hw1_data$Ozone>31) & (hw1_data$Temp>90),]
SR<-newdata$Solar.R
mSR<-is.na(SR)
mean(SR[!mSR])

mean(hw1_data[hw1_data$Month==6,"Temp"])

mayoz<-hw1_data[hw1_data$Month==5,"Ozone"]
mismayoz<-is.na(mayoz)
max(mayoz[!mismayoz])





