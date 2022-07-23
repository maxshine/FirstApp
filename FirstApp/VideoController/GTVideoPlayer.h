//
//  GTVideoPlayer.h
//  FirstApp
//
//  Created by Yang Gao on 2022/7/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoPlayer : NSObject

@property(nonatomic, strong, readwrite, nullable) AVPlayerItem *avPlayerItem;
@property(nonatomic, strong, readwrite, nullable) AVPlayer *avPlayer;
@property(nonatomic, strong, readwrite) AVPlayerLayer *avPlayerLayer;

+ (GTVideoPlayer *) Player;
- (void) playVideoWithUrl: (NSString *) videoUrl attachView: (UIView *) attachView;

@end

NS_ASSUME_NONNULL_END
