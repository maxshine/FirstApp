//
//  GTScreen.h
//  FirstApp
//
//  Created by Yang Gao on 2022/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define UI(x) UIAdapt(x)
#define UIRect(x, y, width, height) UIRectAdapt(x, y, width, height)

static inline NSInteger UIAdapt (float x) {
    CGFloat scale = 414 / SCREEN_WIDTH;
    return (NSInteger) x / scale;
}

static inline CGRect UIRectAdapt (float x, float y, float width, float height) {
    return CGRectMake(UIAdapt(x), UIAdapt(y), UIAdapt(width), UIAdapt(height));
}

@interface GTScreen : UIView

@end

NS_ASSUME_NONNULL_END
