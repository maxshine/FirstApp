//
//  GTVideoCoverView.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/22.
//

#import "GTVideoCoverView.h"
#import "AVFoundation/AVFoundation.h"

@implementation GTVideoCoverView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
                    _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
                    _coverView;
                })];
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-50)/2, (frame.size.height-50)/2, 50, 50)];
            _playButton.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
            _playButton;
        })];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToPlay)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void) tapToPlay {
    NSLog(@"");
    NSURL *url = [NSURL URLWithString:self.videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:url];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
    layer.frame = self.coverView.bounds;
    [self.coverView.layer addSublayer:layer];
    [player play];
}

- (void) layoutWithVideoCoverUrl: (NSString *) videoCoverUrl videoUrl:(NSString *) videoUrl {
    self.coverView.image = [UIImage imageNamed:videoCoverUrl];
    self.videoUrl = videoUrl;
}
@end
