//
//  GTListData.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/11.
//

#import "GTListData.h"

@implementation GTListData

- (void) loadListData {
    
    NSString *urlString = @"https://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listURL = [NSURL URLWithString:urlString];
    __unused NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:listRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"");
    }];
    [dataTask resume];
    NSLog(@"");
}

@end
