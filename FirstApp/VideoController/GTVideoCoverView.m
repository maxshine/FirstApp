//
//  GTVideoCoverView.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/22.
//

#import "GTVideoCoverView.h"
#import <AVFoundation/AVFoundation.h>
#import "GTVideoPlayer.h"

@implementation GTVideoCoverView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
                    _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - GTVideoToobarHeight)];
                    _coverView;
                })];
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-50)/2, (frame.size.height- GTVideoToobarHeight - 50)/2, 50, 50)];
            _playButton.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
            _playButton;
        })];
        
        [self addSubview:({
            self.toolbar = [[GTVideoToobar alloc] initWithFrame:CGRectMake(0, self.coverView.bounds.size.height, frame.size.width, GTVideoToobarHeight)];
            self.toolbar;
        })];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToPlaySingleInstance)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.avPlayerItem removeObserver:self forKeyPath:@"status"];
    [self.avPlayerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
}

- (void) tapToPlaySingleInstance {
    GTVideoPlayer *player = [GTVideoPlayer Player];
    [player playVideoWithUrl:self.videoUrl attachView:self.coverView];
}

- (void) tapToPlay {
    NSLog(@"");
    NSURL *url = [NSURL URLWithString:self.videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:url];
    self.avPlayerItem = [AVPlayerItem playerItemWithAsset:asset];
    [self.avPlayerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self.avPlayerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    self.avPlayer = [AVPlayer playerWithPlayerItem:self.avPlayerItem];
    [self.avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(10, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"Played %f", CMTimeGetSeconds(time));
    }];
    self.avPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer ];
    self.avPlayerLayer.frame = self.coverView.bounds;
    [self.coverView.layer addSublayer:self.avPlayerLayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
//    [self.avPlayer play];
}

- (void) layoutWithVideoCoverUrl: (NSString *) videoCoverUrl videoUrl:(NSString *) videoUrl {
    self.coverView.image = [UIImage imageNamed:videoCoverUrl];
    self.videoUrl = videoUrl;
    [self.toolbar layoutWithModel:nil];
}

- (void) handlePlayEnd {
    NSLog(@"Play End");
    [self.avPlayerLayer removeFromSuperlayer];
    self.avPlayer = nil;
    self.avPlayerItem = nil;
//    [self.avplayer seekToTime:CMTimeMake(0, 1)]; // replay from the beginning
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
            CMTime duration = self.avPlayerItem.duration;
            CGFloat videoSecons = CMTimeGetSeconds(duration);
            [self.avPlayer play];
        } else {
            NSLog(@"Play Asset load failure");
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSLog(@"Buffered %@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}
@end
