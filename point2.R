## The data is aggreagted by date an sum of steps is calculated using which 
## the histogram is plotted

sumdailysteps<-aggregate(activitydata$steps,by=list(activitydata$date),sum,na.rm=TRUE)

## Names assigned to columns
names(sumdailysteps)<-c('date','sumdailysteps')

## Histogram code. Breaks = 20 used
hist(sumdailysteps$sumdailysteps,xlab = 'Date',ylab='Sum of Daily Steps',
          main='Total Daily Steps',breaks = 20)





