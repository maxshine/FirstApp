//
//  GTChatViewController.m
//  FirstApp
//
//  Created by Yang Gao on 2022/6/30.
//

#import "GTVideoViewController.h"
#import "GTVideoCoverView.h"

@implementation GTVideoViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTVideoCoverView" forIndexPath:indexPath];
    if ([collectionViewCell isKindOfClass:[GTVideoCoverView class]]) {
        // http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
        [((GTVideoCoverView *)collectionViewCell) layoutWithVideoCoverUrl:@"icon.bundle/cover.png" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }
//    [collectionViewCell.contentView setBackgroundColor:[UIColor redColor]];
    return collectionViewCell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
