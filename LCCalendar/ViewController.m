//
//  ViewController.m
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "ViewController.h"
#import "LCCalendarView.h"

@interface ViewController ()<LCCalendarViewDelegate>
@property(nonatomic,strong)LCCalendarView *calendarView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _calendarView=[[LCCalendarView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height*1/2)];
    _calendarView.delegate=self;
    [self.view addSubview:_calendarView];


    NSDate *date = [NSDate date];//这个是NSDate类型的日期，所要获取的年月日都放在这里；

    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|
    NSDayCalendarUnit;//这句是说你要获取日期的元素有哪些。获取年就要写NSYearCalendarUnit，获取小时就要写NSHourCalendarUnit，中间用|隔开；

    NSDateComponents *d = [cal components:unitFlags fromDate:date];//把要从date中获取的unitFlags标示的日期元素存放在NSDateComponents类型的d里面；
    //然后就可以从d中获取具体的年月日了；
    NSInteger year = [d year];
    NSInteger month = [d month];

    [_calendarView setNormal:month Day:9];
    [_calendarView setAlarm:month Day:10];
    [_calendarView setLock:month Day:11];

    [_calendarView setNormal:month Day:15];
    [_calendarView setAlarm:month Day:14];
    [_calendarView setLock:month Day:16];

    [_calendarView setNormal:month Day:18];
    [_calendarView setAlarm:month Day:19];
    [_calendarView setLock:month Day:20];

    [_calendarView updateCalendar];

    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - VMCalendarViewDelegate
-(void)changeCalendarTime{
    _calendarView.isUpdateing=NO;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
