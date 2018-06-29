//
//  LCDateEntity.h
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCDateEntity : NSObject
{
    BOOL bSelected;
    BOOL bToday;
    BOOL bEnable;

    NSInteger dayType;//0-day 1-normal 2-alarm
    NSInteger week;
    NSInteger yearNumber;
    NSInteger monthNumber;
    NSInteger dayNumber;
}
@property(assign)BOOL bSelected;
@property(assign)BOOL bToday;
@property(assign)BOOL bEnable;
@property(assign)NSInteger dayType;
@property(assign)NSInteger week;
@property(assign)NSInteger yearNumber;
@property(assign)NSInteger monthNumber;
@property(assign)NSInteger dayNumber;

@end
