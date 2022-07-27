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

#define IS_IPHONE_X (SCREEN_WIDTH == [GTScreen sizeFor58Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor58Inch].height)
#define IS_IPHONE_XR (SCREEN_WIDTH == [GTScreen sizeFor61Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor61Inch].height && [UIScreen mainScreen].scale == 2)
#define IS_IPHONE_XMAX (SCREEN_WIDTH == [GTScreen sizeFor65Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor65Inch].height && [UIScreen mainScreen].scale == 3)
#define IS_IPHONE_X_XR_XMAX (IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XMAX)
#define STATUSBAR_HEIGHT (IS_IPHONE_X_XR_XMAX ? 44 : 20)
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

+ (CGSize) sizeFor65Inch;

+ (CGSize) sizeFor61Inch;

+ (CGSize) sizeFor58Inch;

@end

NS_ASSUME_NONNULL_END
