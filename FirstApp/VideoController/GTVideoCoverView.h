//
//  GTVideoCoverView.h
//  FirstApp
//
//  Created by Yang Gao on 2022/7/22.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "GTVideoToobar.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoCoverView : UICollectionViewCell

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, copy, readwrite) NSString *videoUrl;
@property(nonatomic, strong, readwrite, nullable) AVPlayerItem *avPlayerItem;
@property(nonatomic, strong, readwrite, nullable) AVPlayer *avPlayer;
@property(nonatomic, strong, readwrite) AVPlayerLayer *avPlayerLayer;

@property(nonatomic, strong, readwrite) GTVideoToobar *toolbar;

- (void) layoutWithVideoCoverUrl: (NSString *) videoCoverUrl videoUrl:(NSString *) videoUrl;

@end

NS_ASSUME_NONNULL_END
