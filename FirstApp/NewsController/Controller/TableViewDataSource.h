//
//  TableViewDataSource.h
//  FirstApp
//
//  Created by Yang Gao on 2022/6/28.
//
#import <UIKit/UIKit.h>
#import <UIKit/UITableView.h>
#import "GTNormalTableViewCell.h"
#import "GTListData.h"

#ifndef TableViewDataSource_h
#define TableViewDataSource_h
@interface TableViewDataSource:UITableViewController <GTNormalTableViewCellDelegate>

@property(nonatomic, strong, readwrite) GTListData* loader;

@end

#endif /* TableViewDataSource_h */
