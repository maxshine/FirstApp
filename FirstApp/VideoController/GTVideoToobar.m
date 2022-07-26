//
//  GTVideoToobar.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/26.
//

#import "GTVideoToobar.h"

@implementation GTVideoToobar

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
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:({
            self.avatarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.avatarImageView.layer.masksToBounds = YES;
            self.avatarImageView.layer.cornerRadius = 15;
            self.avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
            self.avatarImageView;
        })];
        [self addSubview:({
            self.nickLabel = [[UILabel alloc] init];
            self.nickLabel.font = [UIFont systemFontOfSize:15];
            self.nickLabel.textColor = [UIColor lightGrayColor];
            self.nickLabel.translatesAutoresizingMaskIntoConstraints = NO;
            self.nickLabel;
        })];

        [self addSubview:({
            self.commentImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.commentImageView.layer.masksToBounds = YES;
            self.commentImageView.layer.cornerRadius = 15;
            self.commentImageView.translatesAutoresizingMaskIntoConstraints = NO;

            self.commentImageView;
        })];
        [self addSubview:({
            self.commentLabel = [[UILabel alloc] init];
            self.commentLabel.font = [UIFont systemFontOfSize:15];
            self.commentLabel.textColor = [UIColor lightGrayColor];
            self.commentLabel.translatesAutoresizingMaskIntoConstraints = NO;

            self.commentLabel;
        })];

        [self addSubview:({
            self.likeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.likeImageView.layer.masksToBounds = YES;
            self.likeImageView.layer.cornerRadius = 15;
            self.likeImageView.translatesAutoresizingMaskIntoConstraints = NO;

            self.likeImageView;
        })];
        [self addSubview:({
            self.likeLabel = [[UILabel alloc] init];
            self.likeLabel.font = [UIFont systemFontOfSize:15];
            self.likeLabel.textColor = [UIColor lightGrayColor];
            self.likeLabel.translatesAutoresizingMaskIntoConstraints = NO;

            self.likeLabel;
        })];

        [self addSubview:({
            self.shareImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.shareImageView.layer.masksToBounds = YES;
            self.shareImageView.layer.cornerRadius = 15;
            self.shareImageView.translatesAutoresizingMaskIntoConstraints = NO;
            self.shareImageView.contentMode = UIViewContentModeScaleToFill;
            self.shareImageView;
        })];
        
        [self addSubview:({
            self.shareLabel = [[UILabel alloc] init];
            self.shareLabel.font = [UIFont systemFontOfSize:15];
            self.shareLabel.textColor = [UIColor lightGrayColor];
            self.shareLabel.translatesAutoresizingMaskIntoConstraints = NO;
            self.shareLabel;
        })];

//        [self.layer addSublayer:({
//            CALayer *bottomLine = [[CALayer alloc] init];
//            bottomLine.frame = CGRectMake(0, frame.size.height - 0.5, SCREEN_WIDTH, 0.5);
//            bottomLine.backgroundColor = [UIColor lightGrayColor].CGColor;
//            bottomLine;
//        })];
    }
    return self;
}

- (void) layoutWithModel: (id) model {
    self.avatarImageView.image = [UIImage imageNamed:@"icon.bundle/icon.png"];
    self.nickLabel.text = @"极客时间";

    self.commentImageView.image = [UIImage imageNamed:@"icon.bundle/comment@3x.png"];
    self.commentLabel.text = @"100";

    self.likeImageView.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
    self.likeLabel.text = @"25";

    self.shareImageView.image = [UIImage imageNamed:@"icon.bundle/share@2x.png"];
    self.shareLabel.text = @"分享";
    
    [NSLayoutConstraint activateConstraints:@[

         [NSLayoutConstraint constraintWithItem:self.avatarImageView
                                      attribute:NSLayoutAttributeCenterY
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                      attribute:NSLayoutAttributeCenterY
                                     multiplier:1
                                       constant:0],

         [NSLayoutConstraint constraintWithItem:self.avatarImageView
                                      attribute:NSLayoutAttributeLeft
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                      attribute:NSLayoutAttributeLeft
                                     multiplier:1
                                       constant:15],

         [NSLayoutConstraint constraintWithItem:self.avatarImageView
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1
                                       constant:30],

         [NSLayoutConstraint constraintWithItem:self.avatarImageView
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1
                                       constant:30],

         [NSLayoutConstraint constraintWithItem:_nickLabel
                                      attribute:NSLayoutAttributeCenterY
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self.avatarImageView
                                      attribute:NSLayoutAttributeCenterY
                                     multiplier:1
                                       constant:0],

         [NSLayoutConstraint constraintWithItem:_nickLabel
                                      attribute:NSLayoutAttributeLeft
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self.avatarImageView
                                      attribute:NSLayoutAttributeRight
                                     multiplier:1
                                       constant:0],

    ]];

    
    NSString *vflString = @"H:|-15-[_avatarImageView]-0-[_nickLabel]-(>=0)-[_commentImageView(==_avatarImageView)]-0-[_commentLabel]-15-[_likeImageView(==_avatarImageView)]-0-[_likeLabel]-15-[_shareImageView(==_avatarImageView)]-0-[_shareLabel]-15-|";

    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vflString options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_avatarImageView, _nickLabel, _commentImageView, _commentLabel, _likeImageView, _likeLabel, _shareImageView, _shareLabel)]];

}

@end
