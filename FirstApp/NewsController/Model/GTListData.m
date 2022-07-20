//
//  GTListData.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/11.
//

#import "GTListData.h"
#import <AFNetworking.h>
#import "GTListItem.h"

@implementation GTListData

- (void) loadListDataWithFinishBlock: (GTListDataFinishBlock)finishBlock {
    
    NSString *urlString = @"https://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listURL = [NSURL URLWithString:urlString];
    __unused NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
//    [[AFHTTPSessionManager manager] GET:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//        }];
    
    NSArray<GTListItem *> *listData = [self _readDataFromLocal];
    if (listData && finishBlock) {
        finishBlock(YES, listData);
    }
    
    // request latest data
//    NSURLSession *urlSession = [NSURLSession sharedSession];
//    __weak typeof(self) wself = self;
//    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:listRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        __strong typeof(self) strongself = wself;
//        NSError *jsonError;
//        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
//#warning type checking
//        NSArray *dataArray = [(NSDictionary*)[(NSDictionary*) jsonObject objectForKey:@"result"] objectForKey:@"data"];
//        NSMutableArray *listItemArray = @[].mutableCopy;
//        for (NSDictionary *entry in dataArray) {
//            GTListItem * listItem = [[GTListItem alloc] init];
//            [listItem configWithDictionary:entry];
//            [listItemArray addObject:listItem];
//        }
//        [strongself _archiveListDataWithArray:listItemArray.copy];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (finishBlock) {
//                finishBlock(error == nil, listItemArray.copy);
//            }
//        });
//    }];
//    [dataTask resume];
}

#pragma mark - private methods

- (NSArray<GTListItem *> *) _readDataFromLocal {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"GTData/list"];
    NSData *readListData = [fileManager contentsAtPath:listDataPath];
    id unarchivedObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [GTListItem class], [NSString class], nil] fromData:readListData error:nil];
    if ([unarchivedObj isKindOfClass:[NSArray class]] && [unarchivedObj count] > 0) {
        return (NSArray<GTListItem *> *) unarchivedObj;
    }
    return nil;
}

- (void) _archiveListDataWithArray: (NSArray<GTListItem*> *) array {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];;
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
//    if (!fileExist) {
//        [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
//        NSData *readListData = [fileManager contentsAtPath:listDataPath];
//        id unarchivedObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [GTListItem class], [NSString class], nil] fromData:readListData error:nil];
//        NSLog(@"");
//    }
//    [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"test"];
//    NSData *test = [[NSUserDefaults standardUserDefaults] dataForKey:@"test"];
//    id unarchivedObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [GTListItem class], [NSString class], nil] fromData:test error:nil];
//
    NSLog(@"");
}

- (void) _getSandBoxPath {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    if (fileExist) {
        [fileManager removeItemAtPath:listDataPath error:nil];
    }
    NSData *listData = [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle synchronizeFile];
    [fileHandle closeFile];
    NSLog(@"%@", pathArray);
}

@end
