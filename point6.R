## The new dataframe with no missing values is mutated to add a new column 
## The new column identifies whether the date for each record is a Weekday or Weekend

nonmissingactivitydata<-mutate(nonmissingactivitydata,weekofday=
              ifelse(weekdays(nonmissingactivitydata$date) 
                     %in% c('Saturday','Sunday'),'Weekend','Weekday'))

## The data is aggregated for mean of number of steps by interval and weekofday column
averageintervalwday<-aggregate(nonmissingactivitydata$steps,
by=list(nonmissingactivitydata$interval,nonmissingactivitydata$weekofday),mean,na.rm=TRUE)

## Names are assigned to the columns
names(averageintervalwday)<-c('interval','dayofweek','meanofsteps')

## GGPlOT is used to plot 2 line graphs in a panel. Average number of steps are plotted against
## the interval for both Weekdays and Weekends. 
ggplot(averageintervalwday,aes(x=interval,y=meanofsteps,color=dayofweek)
       ,group=dayofweek)+geom_line()+geom_point()+facet_grid(dayofweek~.)+
        labs(title='Average Steps for Intervals by Day of Week')+
        xlab('Intervals')+
        ylab('Average Steps')


