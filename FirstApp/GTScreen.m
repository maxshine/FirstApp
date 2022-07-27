//
//  GTScreen.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/27.
//

#import "GTScreen.h"

@implementation GTScreen

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (CGSize) sizeFor65Inch {
    return CGSizeMake(414, 896);
}

+ (CGSize) sizeFor61Inch {
    return CGSizeMake(414, 896);
}

+ (CGSize) sizeFor58Inch {
    return CGSizeMake(375, 812);
}

@end
