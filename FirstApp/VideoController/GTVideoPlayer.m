//
//  GTVideoPlayer.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/24.
//

#import "GTVideoPlayer.h"

@implementation GTVideoPlayer

+ (GTVideoPlayer *) Player {
    static GTVideoPlayer* player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[GTVideoPlayer alloc] init];
    });
    return player;
}

- (void) playVideoWithUrl: (NSString *) videoUrl attachView: (UIView *) attachView {
    [self stopPlay];
    NSURL *url = [NSURL URLWithString:videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:url];
    self.avPlayerItem = [AVPlayerItem playerItemWithAsset:asset];
    [self.avPlayerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self.avPlayerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    self.avPlayer = [AVPlayer playerWithPlayerItem:self.avPlayerItem];
    [self.avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(10, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"Played %f", CMTimeGetSeconds(time));
    }];
    self.avPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer ];
    self.avPlayerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:self.avPlayerLayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}

- (void) stopPlay {
    NSLog(@"Play End");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.avPlayerLayer removeFromSuperlayer];
    [self.avPlayerItem removeObserver:self forKeyPath:@"status"];
    [self.avPlayerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    self.avPlayer = nil;
    self.avPlayerItem = nil;
//    [self.avplayer seekToTime:CMTimeMake(0, 1)]; // replay from the beginning
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
