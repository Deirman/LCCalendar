//
//  LCClalendarButton.m
//  LCCalendar
//
//  Created by Deirman on 2018/6/29.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "LCClalendarButton.h"

@implementation LCClalendarButton

- (id)initWithFrame:(CGRect)frame buttonType:(CLALENDAR_BUTTON_TYPE)type
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        if (type==BUTTON_LAST) {
            [self setBackgroundImage:[UIImage imageNamed:@"calendar_last_normal"] forState:UIControlStateNormal];
            [self setBackgroundImage:[UIImage imageNamed:@"calendar_last_selected"] forState:UIControlStateHighlighted];
            [self setBackgroundImage:[UIImage imageNamed:@"calendar_last__selected"] forState:UIControlStateSelected];
        }else{
            [self setBackgroundImage:[UIImage imageNamed:@"calendar_next_normal"] forState:UIControlStateNormal];
            [self setBackgroundImage:[UIImage imageNamed:@"calendar_next_selected"] forState:UIControlStateHighlighted];
            [self setBackgroundImage:[UIImage imageNamed:@"calendar_next_selected"] forState:UIControlStateSelected];

        }

    }
    return self;
}
-(void)setButtonSelected:(BOOL)selected{
    switch (_myType) {
        case BUTTON_LAST:
            if(!selected){
                [self setBackgroundImage:[UIImage imageNamed:@"calendar_last_normal"] forState:UIControlStateNormal];
            }else{
                [self setBackgroundImage:[UIImage imageNamed:@"calendar_last_selected"] forState:UIControlStateSelected];
            }

            break;

        case BUTTON_NEXT:
            if(!selected){
                [self setBackgroundImage:[UIImage imageNamed:@"calendar_next_normal"] forState:UIControlStateNormal];
            }else{
                [self setBackgroundImage:[UIImage imageNamed:@"calendar_next_selected"] forState:UIControlStateSelected];
            }
            break;

        default:
            break;
    }

}
@end
