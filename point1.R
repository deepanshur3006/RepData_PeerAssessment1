## Reading the data from csv and chnaging the class of date column to Date from Factor

activitydata<-read.csv('activity.csv',header = TRUE,na.strings = 'NA')
activitydata$date<-as.Date(activitydata$date)
