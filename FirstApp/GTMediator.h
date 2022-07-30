//
//  GTMediator.h
//  FirstApp
//
//  Created by Yang Gao on 2022/7/31.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface GTMediator : NSObject

// target-action
+ (__kindof UIViewController *) detailViewControllerWithUrl: (NSString *)url;


//url scheme
typedef void (^GTMediatorProcessBlock) (NSDictionary *params);
+ (void) registerScheme: (NSString *)scheme processBlock: (GTMediatorProcessBlock)processBlock;
+ (void) openUrl: (NSString *)url params: (NSDictionary *) params;
@end

NS_ASSUME_NONNULL_END
