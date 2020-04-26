## Total number of missing values in the steps column
sum(is.na(activitydata$steps))

nonmissingactivitydata<-activitydata
## Indexes from data where NA values are present
nasteps<-which(is.na(activitydata$steps))

## For the indexes identified above, the NA values in steps column are replaced by the
## average number of steps of the corresponding time interval
for(i in nasteps){
        
        nonmissingactivitydata$steps[i]<-
                averagebyinterval$average[which(averagebyinterval$interval==nonmissingactivitydata$interval[i])]
}

## The new dataframe is aggregated on number of steps by date
sumnonmissingsteps<-aggregate(nonmissingactivitydata$steps,
                              by=list(nonmissingactivitydata$date),sum,na.rm=TRUE)

## Names assigned to columns
names(sumnonmissingsteps)<-c('date','sumdailysteps')

## Histogram of the total number of daily steps as per the new data
hist(sumnonmissingsteps$sumdailysteps,xlab = 'Date',ylab='Sum of Daily Steps',
     main='Total Daily Steps',breaks = 20)

## Mean and Median of the total number of daily steps for the new data
mean(sumnonmissingsteps$sumdailysteps)

median(sumdailysteps$sumdailysteps)