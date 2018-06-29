//
//  LCDateButton.h
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LCDateEntity.h"

@protocol LCDateButtonDelegate;

@interface LCDateButton : UIButton{
    LCDateEntity* date;
    id<LCDateButtonDelegate> delegate;
}

@property(nonatomic,strong)LCDateEntity* date;
@property(nonatomic,strong)UILabel*labelTitle;
@property(nonatomic,strong)UIImageView*typeImage;
@property(nonatomic,assign)BOOL isClick;
//@property(assign)id<MyDateButtonDelegate> delegate;
-(void)setLabelTitleName:(NSString *)title;

@end

@protocol LCDateButtonDelegate

-(void)LCDateButton:(LCDateButton*)buttont;

@end
