//
//  LCDateEntity.m
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "LCDateEntity.h"

@implementation LCDateEntity

@synthesize bSelected;
@synthesize bEnable;
@synthesize bToday;
@synthesize yearNumber;
@synthesize monthNumber;
@synthesize dayNumber;
@synthesize week;
@synthesize dayType;

-(id)init
{
    self = [super init];
    if(self){
        bSelected = NO;
        bEnable = NO;
        bToday = NO;
        dayType = 0;
        yearNumber = -1;
        monthNumber = -1;
        dayNumber = -1;
        week = -1;
    }
    return self;
}


@end
