//
//  GTDetailViewController.h
//  FirstApp
//
//  Created by Yang Gao on 2022/7/8.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDetailViewController : UIViewController <WKNavigationDelegate>

@property(nonatomic, strong, readwrite) WKWebView* webView;
@property(nonatomic, strong, readwrite) UIProgressView* progressView;

@end

NS_ASSUME_NONNULL_END
