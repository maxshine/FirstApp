//
//  GTMediator.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/31.
//

#import "GTMediator.h"

@implementation GTMediator

+ (__kindof UIViewController *) detailViewControllerWithUrl: (NSString *)url {
    Class detailCls = NSClassFromString(@"GTDetailViewController");
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:url];
    return controller;
}

@end
