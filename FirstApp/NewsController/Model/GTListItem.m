//
//  GTListItem.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/14.
//

#import "GTListItem.h"

@implementation GTListItem


- (void) configWithDictionary: (NSDictionary*) dictionary {
#warning "type checking and object existence"
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];;
    self.uniqueKey = [dictionary objectForKey:@"uniquekey"];;
    self.title = [dictionary objectForKey:@"title"];;
    self.date = [dictionary objectForKey:@"date"];;
    self.authorName = [dictionary objectForKey:@"author_name"];;
    self.articleUrl = [dictionary objectForKey:@"url"];;
}

@end
