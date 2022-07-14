//
//  GTDeleteView.h
//  FirstApp
//
//  Created by Yang Gao on 2022/7/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteView : UIView

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;
@property(nonatomic, copy, readwrite) dispatch_block_t deleteBlock;

- (void) showDeleteViewFromPoint: (CGPoint)point clickBlock: (dispatch_block_t) deleteBlock;
@end

NS_ASSUME_NONNULL_END
