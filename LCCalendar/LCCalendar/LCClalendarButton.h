//
//  LCClalendarButton.h
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCClalendarDefine.h"
@interface LCClalendarButton : UIButton
@property(nonatomic,assign)CLALENDAR_BUTTON_TYPE myType;
-(void)setButtonSelected:(BOOL)selected;
- (id)initWithFrame:(CGRect)frame buttonType:(CLALENDAR_BUTTON_TYPE)type;
@end
