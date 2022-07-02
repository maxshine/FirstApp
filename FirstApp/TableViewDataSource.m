//
//  TableViewDataSource.m
//  FirstApp
//
//  Created by Yang Gao on 2022/6/28.
//

#import <Foundation/Foundation.h>
#import "TableViewDataSource.h"

@implementation TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!tableCell) {
        tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    tableCell.textLabel.text = [NSString stringWithFormat:@"主标题 - %@", @(indexPath.row)];
    tableCell.detailTextLabel.text = @"副标题";
    return tableCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *subViewController = [[UIViewController alloc] init];
    subViewController.title = [NSString stringWithFormat:@"Title %@", @(indexPath.row)];
    [self.navigationController pushViewController:subViewController animated:YES];
}
@end
