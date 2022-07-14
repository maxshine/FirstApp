//
//  GTListData.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/11.
//

#import "GTListData.h"
#import <AFNetworking.h>
#import "GTListItem.h""

@implementation GTListData

- (void) loadListData {
    
    NSString *urlString = @"https://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listURL = [NSURL URLWithString:urlString];
    __unused NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
    [[AFHTTPSessionManager manager] GET:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:listRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonError;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
#warning type checking
        NSArray *dataArray = [(NSDictionary*)[(NSDictionary*) jsonObject objectForKey:@"result"] objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *entry in dataArray) {
            GTListItem * listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary:entry];
            [listItemArray addObject:listItem];
        }
        NSLog(@"");
    }];
    [dataTask resume];
    NSLog(@"");
}

@end
