//
//  GTRecommendViewController.m
//  FirstApp
//
//  Created by Yang Gao on 2022/7/2.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController () <UIScrollViewDelegate>

@end

@implementation GTRecommendViewController

- (instancetype) init {
    self = [super init];
    if (self) {
        [self.view setBackgroundColor:[UIColor yellowColor]];
        self.tabBarItem.title = @"Mine";
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [scrollView setBackgroundColor:[UIColor lightGrayColor]];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*5, self.view.bounds.size.height);
    NSArray *colorArray = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor yellowColor], [UIColor blackColor]];
    for (int i=0; i<5; i++) {
        [scrollView addSubview:({
            
            UIImage *image2x = [UIImage imageNamed:@"testScale"];
//            UIImage *image3x = [UIImage imageNamed:@"icon.bundle/testScale@3x.png"];
            
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width*i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            UITapGestureRecognizer *tagGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
            [view addGestureRecognizer:tagGesture];
            [view setBackgroundColor:[colorArray objectAtIndex:i]];
            view;
        })];
    }
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) viewClick {
    NSLog(@"scroll view clicked");
    NSURL *appURL = [NSURL URLWithString:@"testSchema://"];
    if ([[UIApplication sharedApplication] canOpenURL:appURL]) {
        [[UIApplication sharedApplication] openURL:appURL options:nil completionHandler:^(BOOL success) {
            NSLog(@"open url in scroll view");
        }];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // NSLog(@"scrollViewDidScroll %@", @(scrollView.contentOffset.x));
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDragging");
    
}
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scrollViewDidEndDragging");
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

@end
