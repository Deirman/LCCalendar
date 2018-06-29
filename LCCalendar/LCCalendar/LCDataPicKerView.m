//
//  LCDataPicKerView.m
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "LCDataPicKerView.h"
#import "LCClalendarDefine.h"
#import "LCClalendarButton.h"


@implementation LCDataPicKerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView*backGroundView=[[UIImageView alloc]initWithFrame: CGRectMake(0, (self.frame.size.height*1/5)*1/2,self.frame.size.width, self.frame.size.height*4/5)];
        [backGroundView setImage:[UIImage imageNamed:@"calendar_DataPickerView_backGround"]];
        [self addSubview:backGroundView];
        backGroundView.userInteractionEnabled = YES;

        _Title=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, self.frame.size.width-40, frame.size.height)];
        _Title.font=[UIFont boldSystemFontOfSize:13];

        [backGroundView addSubview:_Title];
        _Title.textAlignment=NSTextAlignmentCenter;
        _Title.textColor=[UIColor whiteColor];
        _lastButon=[[LCClalendarButton alloc] initWithFrame:CGRectMake(0, 0, 20, frame.size.height) buttonType:BUTTON_LAST];
        _nextButon=[[LCClalendarButton alloc]initWithFrame:CGRectMake(self.frame.size.width-20, 0, 20, self.frame.size.height) buttonType:BUTTON_NEXT];


        [self addSubview:_lastButon];
        [self addSubview:_nextButon];
    }
    return self;
}


@end
