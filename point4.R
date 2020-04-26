## Now the original data is aggregated to calculate the mean of number of steps by intervals

averagebyinterval<-aggregate(activitydata$steps,by=list(activitydata$interval),mean,na.rm=TRUE)

## Names are assigned to columns
names(averagebyinterval)<-c('interval','average')

## Line type plot of the number of average steps take in each 5 minute interval
plot(averagebyinterval$interval,averagebyinterval$average,type='l',xlab = 'Intervals',
           ylab = 'Average Steps',main = 'Average Steps by Interval',xaxt='n')

## The x-axis limits are defined and labels are rotated
axis(1, at = seq(0, 3000, by = 100), las=2)
 
## The interval with maximum average is identified
filter(averagebyinterval,averagebyinterval$average==max(averagebyinterval$average))