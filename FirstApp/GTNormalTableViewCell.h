//
//  GTNormalTableViewCell.h
//  FirstApp
//
//  Created by Yang Gao on 2022/7/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTNormalTableViewCell : UITableViewCell

@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UILabel *sourceLabel;
@property (nonatomic, strong, readwrite) UILabel *commentLabel;
@property (nonatomic, strong, readwrite) UILabel *timeLabel;

- (void) layoutCell;

@end

NS_ASSUME_NONNULL_END
