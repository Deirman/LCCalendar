//
//  LCCalendarView.m
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "LCCalendarView.h"

#import "LCDateButton.h"
#import "LCDateSystem.h"
#import "LCDateEntity.h"
#import "LCClalendarDefine.h"
#import "LCDataPicKerView.h"


@implementation LCCalendarView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        UIImageView*calendarViewBackgroudView=[[UIImageView alloc]initWithFrame:self.bounds];
        [calendarViewBackgroudView setImage:[UIImage imageNamed:@"playback_calendar_backgroup"]];
        calendarViewBackgroudView.multipleTouchEnabled = YES;
        calendarViewBackgroudView.userInteractionEnabled = YES;
        [self addSubview:calendarViewBackgroudView];

        currentMont = [NSDate date];

        currentCalendar = [NSCalendar currentCalendar];
        CGFloat pickHeight;
        pickHeight = self.frame.size.height/2.0;
        _monthPickerView=[[LCDataPicKerView alloc] initWithFrame:CGRectMake(30, 10,100 ,30)];
        _yearPickerView=[[LCDataPicKerView alloc]initWithFrame:CGRectMake(self.frame.size.width-130,10,100,30)];



        [_monthPickerView.lastButon addTarget:self action:@selector(clickLastMonthButton:) forControlEvents:UIControlEventTouchUpInside];
        [_monthPickerView.nextButon addTarget:self action:@selector(clickNextMonthButton:) forControlEvents:UIControlEventTouchUpInside];
        [calendarViewBackgroudView addSubview:_monthPickerView];


        [_yearPickerView.lastButon addTarget:self action:@selector(clickLastYearButton:) forControlEvents:UIControlEventTouchUpInside];
        [_yearPickerView.nextButon addTarget:self action:@selector(clickNextYearButton:) forControlEvents:UIControlEventTouchUpInside];
        [calendarViewBackgroudView addSubview:_yearPickerView];


        UIImageView*weekTitle =[[UIImageView alloc]initWithFrame:CGRectMake(30, 40, self.frame.size.width-60, 25)];
        [weekTitle setImage:[UIImage imageNamed:@"celendar_week_title"]];
        [calendarViewBackgroudView addSubview:weekTitle];


        float cellOriginx;
        float cellOriginY;

        cellOriginx=30;
        cellOriginY=65;
        cellWidth = (self.frame.size.width-60)/7.0;
        cellHeight = (self.frame.size.height-150)/5.0;

        UIImageView*calendarImageView=[[UIImageView alloc]initWithFrame:CGRectMake(cellOriginx, cellOriginY, cellWidth*7, cellHeight*6)];
        [calendarImageView setImage:[UIImage imageNamed:@"calendar_day_backgroud"]];
        [calendarViewBackgroudView addSubview:calendarImageView];

        dayArray = [[NSMutableArray alloc] init];
        for (int i=0; i<42; i++) {
            CGRect rect;
            if (i<7) {
                rect = CGRectMake(cellOriginx+i*cellWidth, cellOriginY+0*cellHeight, cellWidth, cellHeight);
            }else if(i>=7 && i<14){
                rect = CGRectMake(cellOriginx+(i-7)*cellWidth, cellOriginY+cellHeight, cellWidth, cellHeight);
            }else if(i>=14 && i<21){
                rect =CGRectMake(cellOriginx+(i-14)*cellWidth, cellOriginY+2*cellHeight, cellWidth, cellHeight);
            }else if(i>=21 && i<28){
                rect = CGRectMake(cellOriginx+(i-21)*cellWidth, cellOriginY+3*cellHeight, cellWidth, cellHeight);
            }else if(i>=28 && i<35){
                rect = CGRectMake(cellOriginx+(i-28)*cellWidth, cellOriginY+4*cellHeight, cellWidth, cellHeight);
            }else{
                rect = CGRectMake(cellOriginx+(i-35)*cellWidth, cellOriginY+5*cellHeight,cellWidth, cellHeight);
            }
            LCDateButton* daybuttoncell = [[LCDateButton alloc]initWithFrame:rect];
            daybuttoncell.tag=i;
            [calendarViewBackgroudView addSubview:daybuttoncell];
            if (i == 35) {
            }
            [dayArray addObject:daybuttoncell];
        }

        for (int i=0; i<3; i++) {
            UIImageView*colorImageView;
            UILabel*clorTitle;
            CGFloat colorW = (self.frame.size.width-130)/3;
            colorImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30+30*i+colorW*i,self.frame.size.height-30,colorW,10)];

            clorTitle = [[UILabel alloc]initWithFrame: CGRectMake(30+30*i+colorW*i,self.frame.size.height-20,colorW,10)];
            clorTitle.font=[UIFont systemFontOfSize:8];
            clorTitle.textColor = [UIColor whiteColor];
            clorTitle.textAlignment = NSTextAlignmentCenter;
            if (i==0) {
                [colorImageView setImage:[UIImage imageNamed:@"calendar_lock_record"]];
                [clorTitle setText: NSLocalizedString(@"Locked Video", @"锁定记录")];

            }else if (i==1){
                [colorImageView setImage:[UIImage imageNamed:@"calendar_alarm_record"]];
                [clorTitle setText: NSLocalizedString(@"Alarm Video", @"报警记录")];
            }else if (i==2){
                [colorImageView setImage:[UIImage imageNamed:@"calendar_normal_record"]];
                [clorTitle setText: NSLocalizedString(@"Video", @"视频记录")];
            }
            [calendarViewBackgroudView addSubview:colorImageView];
            [calendarViewBackgroudView addSubview:clorTitle];
        }

    }
    [self setBackgroundColor:[UIColor blackColor]];
    system = [[LCDateSystem alloc]init];
    [self updateCalendar];
    _isUpdateing=NO;
    return self;
}

-(LCDateSystem*)GetSystemData
{
    return system;
}


-(void)updateCalendar
{
    [_monthPickerView.Title setText:[self getMonthForNumberMonth:[system.currentMonth month]]];
    _selectMonth=[system.currentMonth month];
    [_yearPickerView.Title setText:[NSString stringWithFormat:@"%04d",[system.currentMonth year]]];
    _selectYear=[system.currentMonth year];
    for (int i=0; i<42; i++) {
        LCDateEntity* dateentity = [[system dateArray]objectAtIndex:i];
        LCDateButton* buttoncell = [dayArray objectAtIndex:i];
        buttoncell.date = dateentity;

        if (dateentity.dayType == CALENDAR_NORMAL) {
            [buttoncell.typeImage setImage:[UIImage imageNamed:@"calendar_normal_records"]];
            [buttoncell setImage:[UIImage imageNamed:@"calendar_day_selected"] forState:UIControlStateHighlighted];
            buttoncell.isClick=YES;

        }else if(dateentity.dayType == CALENDAR_ALARM){
            [buttoncell.typeImage setImage:[UIImage imageNamed:@"calendar_alarm_records"]];
            [buttoncell setImage:[UIImage imageNamed:@"calendar_day_selected"] forState:UIControlStateHighlighted];
            buttoncell.isClick=YES;

        }else if (dateentity.dayType==CALENDAR_LOCK){
            [buttoncell.typeImage setImage:[UIImage imageNamed:@"calendar_lock_records"]];
            [buttoncell setImage:[UIImage imageNamed:@"calendar_day_selected"] forState:UIControlStateHighlighted];
            buttoncell.isClick=YES;
        }else{
            [buttoncell.typeImage setImage:[UIImage imageNamed:@""]];
            [buttoncell setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
            buttoncell.isClick=NO;
        }

        [buttoncell setLabelTitleName:[NSString stringWithFormat:@"%d",dateentity.dayNumber]];
        if (dateentity.bEnable) {file:
            buttoncell.enabled=YES;
            buttoncell.alpha=1;
        }else{
            buttoncell.enabled=NO;
            buttoncell.alpha=0.4;
        }
    }
}

-(void)CleanAllData{
    [system CleanData];
    [self updateCalendar];
}

-(NSString*)getMonthForNumberMonth:(NSInteger)month{
    NSString*moth;
    switch (month) {
        case 1:
            moth=[NSString stringWithFormat:NSLocalizedString(@"Jan", @"一月")];
            break;
        case 2:
            moth=[NSString stringWithFormat:NSLocalizedString(@"Feb", @"二月")];
            break;
        case 3:
            moth=[NSString stringWithFormat:NSLocalizedString(@"Mar", @"三月")];
            break;
        case 4:
            moth=[NSString stringWithFormat:NSLocalizedString(@"Apr", @"四月")];
            break;
        case 5:
            moth=[NSString stringWithFormat:NSLocalizedString(@"May", @"五月")];
            break;
        case 6:
            moth=[NSString stringWithFormat:NSLocalizedString(@"Jun", @"六月")];
            break;
        case 7:
            moth=[NSString stringWithFormat:NSLocalizedString(@"Jul", @"七月")];
            break;
        case 8:
            moth=[NSString stringWithFormat:NSLocalizedString(@"Aug", @"八月")];
            break;
        case 9:
            moth=[NSString stringWithFormat:NSLocalizedString(@"Sep", @"九月")];
            break;
        case 10:
            moth=[NSString stringWithFormat:NSLocalizedString(@"Oct", @"十月")];
            break;
        case 11:
            moth=[NSString stringWithFormat:NSLocalizedString(@"Nov", @"十一月")];
            break;
        case 12:
            moth=[NSString stringWithFormat:NSLocalizedString(@"Dec", @"十二月")];
            break;

        default:
            break;
    }
    return moth;
}

#pragma mark - my function

-(void)setAlarm:(NSInteger)Month Day:(NSInteger)day
{
    [system setAlarm:Month DAY:day];
}

-(void)setNormal:(NSInteger)Month Day:(NSInteger)day
{
    [system setNormal:Month DAY:day];
}
-(void)setLock:(NSInteger)Month Day:(NSInteger)day{
    [system setLock:Month DAY:day];
}

-(void)clickLastMonthButton:(id)sender{
    if (!_isUpdateing) {
        _isUpdateing=YES;
        [_monthPickerView.lastButon setButtonSelected:YES];
        [_monthPickerView.lastButon setButtonSelected:NO];
        _selectMonth=_selectMonth-1;
        if (_selectMonth<1) {
            _selectMonth=12;
            _selectYear-=1;
        }

        [system updataClalendarForYear:_selectYear ForMoth:_selectMonth];
        [self updateCalendar];
        if (_delegate) {
            [_delegate changeCalendarTime];
        }
    }


}
-(void)clickNextMonthButton:(id)sender{
    if (!_isUpdateing) {
        _isUpdateing=YES;
        [_monthPickerView.lastButon setButtonSelected:NO];
        [_monthPickerView.lastButon setButtonSelected:YES];
        _selectMonth=_selectMonth+1;

        if (_selectMonth>12) {
            _selectMonth=1;
            _selectYear+=1;
        }

        [system updataClalendarForYear:_selectYear ForMoth:_selectMonth];
        [self updateCalendar];
        if (_delegate) {
            [_delegate changeCalendarTime];
        }
    }


}
-(void)clickLastYearButton:(id)sender{
    if (!_isUpdateing) {
        _isUpdateing=YES;
        [_yearPickerView.lastButon setButtonSelected:YES];
        [_yearPickerView.lastButon setButtonSelected:NO];
        _selectYear=_selectYear-1;
        [system updataClalendarForYear:_selectYear ForMoth:_selectMonth];
        [self updateCalendar];
        if (_delegate) {
            [_delegate changeCalendarTime];
        }
    }


}
-(void)clickNextYearButton:(id)sender{
    if (!_isUpdateing) {
        _isUpdateing=YES;
        [_yearPickerView.lastButon setButtonSelected:NO];
        [_yearPickerView.lastButon setButtonSelected:YES];
        _selectYear=_selectYear+1;
        [system updataClalendarForYear:_selectYear ForMoth:_selectMonth];
        [self updateCalendar];
        if (_delegate) {
            [_delegate changeCalendarTime];
        }
    }


}

@end
