//
//  GTMediator.h
//  FirstApp
//
//  Created by Yang Gao on 2022/7/31.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@protocol GTDetailViewControllerProtocol <NSObject>
- (__kindof UIViewController *) detailViewControllerWithUrl: (NSString *) detailUrl;
@end

@interface GTMediator : NSObject

// target-action
+ (__kindof UIViewController *) detailViewControllerWithUrl: (NSString *)url;


//url scheme
typedef void (^GTMediatorProcessBlock) (NSDictionary *params);
+ (void) registerScheme: (NSString *)scheme processBlock: (GTMediatorProcessBlock)processBlock;
+ (void) openUrl: (NSString *)url params: (NSDictionary *) params;

// protocol way
+ (void) registerProtocol: (Protocol *)protocol forClass: (Class) cls;
+ (Class) classForProtocol: (Protocol *) protocol;
@end

NS_ASSUME_NONNULL_END
