//
//  LCDateSystem.m
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "LCDateSystem.h"
#import "LCDateEntity.h"

#import "LCClalendarDefine.h"


@implementation LCDateSystem

@synthesize dateArray;
@synthesize currentMonth;
@synthesize realDate;

-(id)init
{
    self = [super init];
    if (self) {
        self.dateArray = [NSMutableArray array];
        for (int i=0; i<42; i++) {
            LCDateEntity* dateentity = [[LCDateEntity alloc]init];
            [dateArray addObject:dateentity];

        }


        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
        NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
        comps = [calendar components:unitFlags fromDate:[NSDate date]];

        self.currentMonth = [LCDate dateForDay:1 month:comps.month  year:comps.year hour:0 min:0 sec:0];

        self.realDate = [LCDate dateFromNSDate:[NSDate date]];

        [self refreshCalendar];
    }
    return self;
}

-(NSInteger)GetMonthDays
{
    return 0;
}

-(NSInteger)GetWeekOfDay:(NSInteger)day
{
    return 0;
}

-(void)updataClalendarForYear:(NSInteger)year ForMoth:(NSInteger)month
{
    LCDate* tempdate = [LCDate dateForDay:1 month:month year:year hour:0 min:0 sec:0];
    self.currentMonth = tempdate;
    [self refreshCalendar];
}

-(void)refreshCalendar
{
    NSDate* tempdate = [currentMonth NSDate];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:tempdate];

    //    NSDate *today = [NSDate dateWithTimeIntervalSinceNow:-24*3600*10];
    //    NSCalendar *c = [NSCalendar currentCalendar];
    //    NSRange days = [c rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:today];

    NSLog(@"tt");

    //update last month
    NSInteger weekday = comps.weekday;
    NSDate* lastcalendar = [NSDate dateWithTimeInterval:-weekday*3600*24 sinceDate:[currentMonth NSDate]];
    NSCalendar *c = [NSCalendar currentCalendar];
    NSRange ldays = [c rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:lastcalendar];
    NSInteger lastmonthdayscount = ldays.length;

    NSRange cdays = [c rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[currentMonth NSDate]];
    NSInteger curmonthdayscount = cdays.length;
    NSInteger useIndex=0;

    unsigned int tempmonth = [currentMonth month];
    unsigned int lasttempmonth;
    unsigned int nexttempmonth;
    lasttempmonth = tempmonth - 1;
    if (lasttempmonth == 0) {
        lasttempmonth = 12;
    }
    nexttempmonth = tempmonth + 1;
    if (nexttempmonth > 12) {
        nexttempmonth = 1;
    }
    //update last month
    for (NSInteger i=useIndex; i<weekday-1; i++) {
        LCDateEntity* dateentity = [dateArray objectAtIndex:i];
        dateentity.bEnable = NO;
        dateentity.bSelected = NO;
        dateentity.bToday = NO;
        dateentity.dayType = 0;
        dateentity.monthNumber = lasttempmonth;
        if (lasttempmonth == 12) {
            dateentity.yearNumber =[currentMonth year]-1;
        }else{
            dateentity.yearNumber =[currentMonth year];
        }
        dateentity.dayNumber = lastmonthdayscount-(weekday-i-2);
        if (dateentity.dayNumber == realDate.day
            && [currentMonth month] == [realDate month]) {
            dateentity.bToday = YES;
        }
        dateentity.week = 7-weekday;
        useIndex++;
    }
    //update current month
    for (NSInteger i=useIndex,j=1; i<weekday+curmonthdayscount-1; i++,j++) {
        LCDateEntity* dateentity = [dateArray objectAtIndex:i];
        dateentity.bEnable = YES;
        dateentity.bSelected = NO;
        dateentity.bToday = NO;
        dateentity.dayType = 0;
        dateentity.yearNumber = [currentMonth year];
        dateentity.monthNumber = tempmonth;
        dateentity.dayNumber = j;
        if (dateentity.dayNumber == realDate.day
            && [currentMonth month] == [realDate month]) {
            dateentity.bToday = YES;
        }
        useIndex++;
    }

    //update next month
    for (NSInteger i=useIndex,j=1; i<42; i++,j++) {
        LCDateEntity* dateentity = [dateArray objectAtIndex:i];
        dateentity.bEnable = NO;
        dateentity.bSelected = NO;
        dateentity.bToday = NO;
        dateentity.dayType = 0;
        dateentity.monthNumber = nexttempmonth;
        if (nexttempmonth == 1) {
            dateentity.yearNumber =[currentMonth year]+1;
        }else{
            dateentity.yearNumber =[currentMonth year];
        }
        dateentity.dayNumber = j;
        if (dateentity.dayNumber == realDate.day
            && dateentity.monthNumber == [realDate month]) {
            dateentity.bToday = YES;
        }
        useIndex++;
    }

}

-(void)setNormal:(NSInteger)month DAY:(NSInteger)day
{
    for (LCDateEntity* dateentity in dateArray) {
        if (dateentity.monthNumber == month
            && dateentity.dayNumber == day) {
            dateentity.dayType = CALENDAR_NORMAL;
            break;
        }
    }
}


-(void)setAlarm:(NSInteger)month DAY:(NSInteger)day
{
    for (LCDateEntity* dateentity in dateArray) {
        if (dateentity.monthNumber == month
            && dateentity.dayNumber == day) {
            dateentity.dayType = CALENDAR_ALARM;
            break;
        }
    }
}

-(void)setLock:(NSInteger)month DAY:(NSInteger)day{
    for (LCDateEntity* dateentity in dateArray) {
        if (dateentity.monthNumber == month
            && dateentity.dayNumber == day) {
            dateentity.dayType = CALENDAR_LOCK;
            break;
        }
    }
}

-(void)CleanData
{
    for (LCDateEntity* dateentity in dateArray) {
        dateentity.dayType = CALENDAR_NONE;
    }
}


@end
