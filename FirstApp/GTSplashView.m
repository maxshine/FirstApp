//
//  GTSplashView.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/29.
//

#import "GTSplashView.h"

@implementation GTSplashView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"icon.bundle/splash.png"];
        [self addSubview:({
            self.skipButton = [[UIButton alloc] initWithFrame:CGRectMake(330, 100, 60, 40)];
            self.skipButton.backgroundColor = [UIColor grayColor];
            [self.skipButton setTitle:@"Skip" forState:UIControlStateNormal];
            [self.skipButton addTarget:self action:@selector(_removeSplash) forControlEvents:UIControlEventTouchUpInside];
            self.skipButton;
        })];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void) _removeSplash {
    [self removeFromSuperview];
}

@end
