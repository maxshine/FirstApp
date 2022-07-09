//
//  TableViewDataSource.h
//  FirstApp
//
//  Created by Yang Gao on 2022/6/28.
//
#import <UIKit/UIKit.h>
#import <UIKit/UITableView.h>
#import "GTNormalTableViewCell.h"

#ifndef TableViewDataSource_h
#define TableViewDataSource_h
@interface TableViewDataSource:UITableViewController <GTNormalTableViewCellDelegate>

@end

#endif /* TableViewDataSource_h */
