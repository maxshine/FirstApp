//
//  GTMediator.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/31.
//

#import "GTMediator.h"

@implementation GTMediator

+ (NSMutableDictionary *) mediatorCache {
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}

+ (__kindof UIViewController *) detailViewControllerWithUrl: (NSString *)url {
    Class detailCls = NSClassFromString(@"GTDetailViewController");
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:url];
    return controller;
}

+ (void) registerScheme: (NSString *)scheme processBlock: (GTMediatorProcessBlock)processBlock {
    if (scheme && processBlock) {
        [[[self class] mediatorCache] setObject: processBlock forKey:scheme];
    }
}
+ (void) openUrl: (NSString *)url params: (NSDictionary *) params {
    GTMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}

@end
