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

+ (__kindof UIViewController *) detailViewControllerWithUrl: (NSString *)url;

@end

NS_ASSUME_NONNULL_END
