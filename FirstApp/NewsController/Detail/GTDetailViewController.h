//
//  GTDetailViewController.h
//  FirstApp
//
//  Created by Yang Gao on 2022/7/8.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "GTMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTDetailViewController : UIViewController <WKNavigationDelegate, GTDetailViewControllerProtocol>

@property(nonatomic, strong, readwrite) WKWebView* webView;
@property(nonatomic, strong, readwrite) UIProgressView* progressView;
@property(nonatomic, strong, readwrite) NSString* articleUrl;

- (instancetype) initWithUrlString: (NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
