//
//  GTDeleteView.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/9.
//

#import "GTDeleteView.h"

@implementation GTDeleteView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            UIView *backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            [backgroundView setBackgroundColor:[UIColor blackColor]];
            backgroundView.alpha = 0.5;
            [backgroundView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickButtion)]];
            self.backgroundView = backgroundView;
            self.backgroundView;
        })];
        [self addSubview:({
            UIButton *deleteButtion = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            [deleteButtion setBackgroundColor:[UIColor blueColor]];
            [deleteButtion addTarget:self action:@selector(clickButtion) forControlEvents:UIControlEventTouchUpInside];
            self.deleteButtion = deleteButtion;
            self.deleteButtion;
        })];
    }
    return self;
}

- (void) showDeleteViewFromPoint: (CGPoint)point clickBlock: (dispatch_block_t) deleteBlock {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
//    [UIView animateWithDuration:1.0f animations:^{
//        self.deleteButtion.frame = CGRectMake((self.frame.size.width-200)/2, (self.frame.size.height-200)/2, 200, 200);
//    }];
    self.deleteButtion.frame = CGRectMake(point.x, point.y, 0, 0);
    self.deleteBlock = [deleteBlock copy];
    [UIView animateWithDuration:1.0f delay:0.5f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.deleteButtion.frame = CGRectMake((self.frame.size.width-200)/2, (self.frame.size.height-200)/2, 200, 200);
    } completion:^(BOOL finished) {
        NSLog(@"Animation finished");
    }];
}

- (void) dismissDeleteView {
    [self removeFromSuperview];
}

- (void) clickButtion {
    if (self.deleteBlock) {
        self.deleteBlock();
    }
    [self removeFromSuperview];
}

@end
