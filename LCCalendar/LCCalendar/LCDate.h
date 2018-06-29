//
//  LCDate.h
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCDate : NSObject

{
    struct {
        unsigned int month : 4;
        unsigned int day : 5;
        unsigned int year : 15;
        unsigned int hour : 8;
        unsigned int min : 8;
        unsigned int sec : 8;
    } a;
}

+ (LCDate *)dateForDay:(unsigned int)day month:(unsigned int)month year:(unsigned int)year hour:(unsigned int)hour min:(unsigned int)min sec:(unsigned int)sec;
+ (LCDate *)dateFromNSDate:(NSDate *)date;

- (id)initForDay:(unsigned int)day month:(unsigned int)month year:(unsigned int)year hour:(unsigned int)hour min:(unsigned int)min sec:(unsigned int)sec;
- (unsigned int)day;
- (unsigned int)month;
- (unsigned int)year;
- (unsigned int)hour;
- (unsigned int)min;
- (unsigned int)sec;

- (void)sethour:(unsigned int)nhour;
- (void)setmin:(unsigned int)nmin;
- (void)setsec:(unsigned int)nsec;

- (NSDate *)NSDate;
- (NSComparisonResult)compare:(LCDate *)otherDate;
- (BOOL)isToday;

@end
