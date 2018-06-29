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
