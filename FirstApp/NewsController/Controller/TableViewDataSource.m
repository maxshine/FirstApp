//
//  TableViewDataSource.m
//  FirstApp
//
//  Created by Yang Gao on 2022/6/28.
//

#import <Foundation/Foundation.h>
#import "TableViewDataSource.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteView.h"
#import "GTListItem.h"
#import "GTMediator.h"
#import "GTSearchBar.h"
#import "GTCommentManager.h"
#import "GTScreen.h"


@implementation TableViewDataSource

- (void)viewDidLoad {
    self.loader = [[GTListData alloc] init];
    [self.loader loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __weak typeof(self) wself = self;
        if (success) {
            __strong typeof(wself) strongself = wself;
            strongself.dataArray = dataArray;
            [self.tableView reloadData];
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    [self.navigationItem setTitleView:({
        GTSearchBar *searchBar = [[GTSearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - UI(20), self.navigationController.navigationBar.bounds.size.height)];
        searchBar;
    //拉起键盘和输入框
//        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - UI(20), self.navigationController.navigationBar.bounds.size.height)];
//        button.backgroundColor = [UIColor lightGrayColor];
//        [button addTarget:self action:@selector(_showCommentView) forControlEvents:UIControlEventTouchUpInside];
//        button;
    })];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GTNormalTableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!tableCell) {
        tableCell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        tableCell.delegate = self;
    }
//    tableCell.textLabel.text = [NSString stringWithFormat:@"主标题 - %@", @(indexPath.row)];
//    tableCell.detailTextLabel.text = @"副标题";
    [tableCell layoutCellWithItemData:[self.dataArray objectAtIndex:indexPath.row]];
    return tableCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GTListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    // mediator
//    GTDetailViewController *subViewController = [[GTDetailViewController alloc] initWithUrlString:[[self.dataArray objectAtIndex:indexPath.row] articleUrl]];
//    __kindof UIViewController *subViewController = [GTMediator detailViewControllerWithUrl:[[self.dataArray objectAtIndex:indexPath.row] articleUrl]];
//    subViewController.title = [NSString stringWithFormat:@"Title %@", @(indexPath.row)];
//    [self.navigationController pushViewController:subViewController animated:YES];
    
    // scheme
//    [GTMediator openUrl:@"detail://" params:@{@"url": item.articleUrl, @"controller": self.navigationController}];
    
    // protocol-class
    Class cls = [GTMediator classForProtocol:@protocol(GTDetailViewControllerProtocol)];
    [self.navigationController pushViewController:[[cls alloc] detailViewControllerWithUrl: item.articleUrl] animated:YES];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniqueKey];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableViewCell: (UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
    NSLog(@"Table Cell delegate");
    GTDeleteView *deleteView = [[GTDeleteView alloc] initWithFrame:self.view.bounds];
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    [deleteView showDeleteViewFromPoint: rect.origin clickBlock: (dispatch_block_t) ^(void){NSLog(@"block action");}];
}

#pragma mark -

- (void)_showCommentView{
    [[GTCommentManager sharedManager] showCommentView];
}

@end


