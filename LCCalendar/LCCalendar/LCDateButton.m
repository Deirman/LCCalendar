//
//  LCDateButton.m
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "LCDateButton.h"
#import "UIView+Position.h"

@implementation LCDateButton
@synthesize date;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        _isClick=NO;
        [self addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        _labelTitle=[[UILabel alloc]initWithFrame:self.bounds];
        //        [_labelTitle setBackgroundColor:[UIColor clearColor]];
        _labelTitle.textColor=[UIColor whiteColor];
        _labelTitle.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_labelTitle];
         _typeImage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 15, _labelTitle.frameWidth-20, self.frame.size.height-20)];
        _typeImage.backgroundColor = [UIColor clearColor];
        _typeImage.userInteractionEnabled=NO;
        [self addSubview:_typeImage];
    }

    return self;
}


-(void)clickButton:(id)sender{

    if (!_isClick) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CalendarNotify_DoubleClick" object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"CalendarNotify" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:date,@"param", nil]];
    }

}
-(void)setLabelTitleName:(NSString *)title{
    _labelTitle.text=title;

}

@end
