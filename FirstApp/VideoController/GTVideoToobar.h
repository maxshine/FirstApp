//
//  GTVideoToobar.h
//  FirstApp
//
//  Created by Yang Gao on 2022/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define GTVideoToobarHeight 60

@interface GTVideoToobar : UIView

@property (nonatomic, strong, readwrite) UIImageView *avatarImageView;
@property (nonatomic, strong, readwrite) UILabel *nickLabel;

@property (nonatomic, strong, readwrite) UIImageView *commentImageView;
@property (nonatomic, strong, readwrite) UILabel *commentLabel;

@property (nonatomic, strong, readwrite) UIImageView *likeImageView;
@property (nonatomic, strong, readwrite) UILabel *likeLabel;

@property (nonatomic, strong, readwrite) UIImageView *shareImageView;
@property (nonatomic, strong, readwrite) UILabel *shareLabel;


- (void) layoutWithModel: (id) model;

@end

NS_ASSUME_NONNULL_END
