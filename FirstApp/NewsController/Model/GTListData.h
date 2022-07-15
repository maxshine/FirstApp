//
//  GTListData.h
//  FirstApp
//
//  Created by Yang Gao on 2022/7/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class GTListItem;
typedef void(^GTListDataFinishBlock)(BOOL success, NSArray<GTListItem*> *dataArray);


@interface GTListData : NSObject

- (void) loadListDataWithFinishBlock: (GTListDataFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
