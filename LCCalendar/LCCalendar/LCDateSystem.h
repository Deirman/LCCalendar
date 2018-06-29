//
//  LCDateSystem.h
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCDate.h"


@interface LCDateSystem : NSObject
{
    NSMutableArray* dateArray;
    LCDate* currentMonth;
    LCDate* realDate;
}

@property(nonatomic,retain)NSMutableArray* dateArray;
@property(nonatomic,retain)LCDate* currentMonth;
@property(nonatomic,retain)LCDate* realDate;


-(NSInteger)GetMonthDays;
-(NSInteger)GetWeekOfDay:(NSInteger)day;
-(void)updataClalendarForYear:(NSInteger)year ForMoth:(NSInteger)month;
-(void)setNormal:(NSInteger)month DAY:(NSInteger)day;
-(void)setAlarm:(NSInteger)month DAY:(NSInteger)day;
-(void)setLock:(NSInteger)month DAY:(NSInteger)day;
-(void)CleanData;

@end
