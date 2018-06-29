//
//  LCDataPicKerView.h
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCClalendarDefine.h"
#import "LCClalendarButton.h"
@interface LCDataPicKerView : UIView

@property(nonatomic,retain)LCClalendarButton*lastButon;
@property(nonatomic,retain)LCClalendarButton*nextButon;
@property(nonatomic,retain)UILabel*Title;
@property(nonatomic,assign)CLALENDAR_BUTTON_TYPE buttonType;

@end
