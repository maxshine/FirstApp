//
//  GTVideoCoverView.h
//  FirstApp
//
//  Created by Yang Gao on 2022/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoCoverView : UICollectionViewCell

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, strong, readwrite) NSString *videoUrl;

- (void) layoutWithVideoCoverUrl: (NSString *) videoCoverUrl videoUrl:(NSString *) videoUrl;

@end

NS_ASSUME_NONNULL_END
