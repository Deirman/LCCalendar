//
//  LCDate.m
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "LCDate.h"
#import "NSDateAdditions.h"

static LCDate *today;


@interface LCDate ()
+ (void)cacheTodaysDate;
@end

@implementation LCDate

+ (void)initialize
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cacheTodaysDate) name:@"FRANKTIME" object:nil];
    [self cacheTodaysDate];
}

+ (void)cacheTodaysDate
{

    today = [LCDate dateFromNSDate:[NSDate date]];
}

+ (LCDate *)dateForDay:(unsigned int)day month:(unsigned int)month year:(unsigned int)year hour:(unsigned int)hour min:(unsigned int)min sec:(unsigned int)sec
{
    return [[LCDate alloc] initForDay:day month:month year:year hour:hour min:min sec:sec] ;
}

+ (LCDate *)dateFromNSDate:(NSDate *)date
{
    NSDateComponents *parts = [date cc_componentsForMonthDayAndYear];
    return [LCDate dateForDay:[parts day] month:[parts month] year:[parts year] hour:[parts hour] min:[parts minute] sec:[parts second]];
}

- (id)initForDay:(unsigned int)day month:(unsigned int)month year:(unsigned int)year hour:(unsigned int)hour min:(unsigned int)min sec:(unsigned int)sec
{
    if ((self = [super init])) {
        a.day = day;
        a.month = month;
        a.year = year;
        a.hour = hour;
        a.min = min;
        a.sec = sec;
    }
    return self;
}

- (unsigned int)day { return a.day; }
- (unsigned int)month { return a.month; }
- (unsigned int)year { return a.year; }
- (unsigned int)hour { return  a.hour; }
- (unsigned int)min { return a.min; }
- (unsigned int)sec { return a.sec; }
- (void)sethour:(unsigned int)nhour {a.hour = nhour;}
- (void)setmin:(unsigned int)nmin {a.min = nmin;}
- (void)setsec:(unsigned int)nsec {a.sec = nsec;}
- (NSDate *)NSDate
{
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = a.day;
    c.month = a.month;
    c.year = a.year;
    c.hour = a.hour;
    c.minute = a.min;
    c.second = a.sec;

    return [[NSCalendar currentCalendar] dateFromComponents:c];
}

- (BOOL)isToday
{
    return [self isEqual:today];
}

- (NSComparisonResult)compare:(LCDate *)otherDate
{
    NSInteger selfComposite = a.year*10000 + a.month*100 + a.day;
    NSInteger otherComposite = [otherDate year]*10000 + [otherDate month]*100 + [otherDate day];

    if (selfComposite < otherComposite)
        return NSOrderedAscending;
    else if (selfComposite == otherComposite)
        return NSOrderedSame;
    else
        return NSOrderedDescending;
}

#pragma mark -
#pragma mark NSObject interface

- (BOOL)isEqual:(id)anObject
{
    if (![anObject isKindOfClass:[LCDate class]])
        return NO;

    LCDate *d = (LCDate*)anObject;
    return a.day == [d day] && a.month == [d month] && a.year == [d year];
}

- (NSUInteger)hash
{
    return a.day;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%u/%u/%u", a.month, a.day, a.year];
}


@end
