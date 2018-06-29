//
//  LCCalendarView.h
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCDateButton.h"
#import "LCDataPicKerView.h"
@class LCDateSystem;
@protocol LCCalendarViewDelegate;

@interface LCCalendarView : UIView
{
    NSMutableArray* dayArray;
    CGFloat cellWidth;
    CGFloat cellHeight;
    NSDate *currentMont;
    NSCalendar *currentCalendar;

    LCDateSystem* system;
}
@property(nonatomic,retain)LCDataPicKerView*monthPickerView;
@property(nonatomic,retain)LCDataPicKerView*yearPickerView;
@property(nonatomic,retain)NSMutableArray* dayArray;
@property(nonatomic,assign)NSInteger selectYear;
@property(nonatomic,assign)NSInteger selectMonth;
@property(nonatomic,assign)BOOL isUpdateing;
@property(nonatomic,assign)id<LCCalendarViewDelegate>delegate;
-(LCDateSystem*)GetSystemData;
-(void)setAlarm:(NSInteger)Month Day:(NSInteger)day;
-(void)setNormal:(NSInteger)Month Day:(NSInteger)day;
-(void)setLock:(NSInteger)Month Day:(NSInteger)day;
-(void)CleanAllData;
-(void)updateCalendar;

@end

@protocol LCCalendarViewDelegate <NSObject>
-(void)changeCalendarTime;
@end
