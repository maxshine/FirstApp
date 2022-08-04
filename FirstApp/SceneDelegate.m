//
//  SceneDelegate.m
//  FirstApp
//
//  Created by Yang Gao on 2022/6/19.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "TableViewDataSource.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"
#import "GTVideoCoverView.h"
#import "GTSplashView.h"
#import "GTLocation.h"
#import "GTNotification.h"

@interface SceneDelegate () <UITabBarControllerDelegate>

@end

@implementation SceneDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"View selected");
//    [self _changeIcon];
}


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    ViewController *rootViewController = [[ViewController alloc] init];
    [rootViewController.view setBackgroundColor:[UIColor whiteColor]];
    
    UINavigationController *viewController1 = [[UINavigationController alloc] initWithRootViewController:rootViewController];
//    UIViewController *viewController1 = [[UIViewController alloc] init];
//    [viewController1.view setBackgroundColor:[UIColor redColor]];
    viewController1.tabBarItem.title = @"Chat";
    [viewController1 setEdgesForExtendedLayout:UIRectEdgeNone];
    
    
    TableViewDataSource *tableViewController = [[TableViewDataSource alloc] init];
    tableViewController.tableView.dataSource = tableViewController;
    tableViewController.tableView.delegate = tableViewController;
//    UIViewController *viewController2 = [[UIViewController alloc] init];
//    UITableView *tableView = [[UITableView alloc] initWithFrame:viewController2.view.bounds style:UITableViewStyleGrouped];
//    TableViewDataSource *datasource = [[TableViewDataSource alloc] init];
//    tableView.dataSource = datasource;
//    [tableView setSeparatorColor:[UIColor redColor]];
//    [tableView setBackgroundColor:[UIColor lightGrayColor]];
//    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
//    [viewController2.view addSubview:tableView];
    UINavigationController *viewController2 = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    [viewController2.view setBackgroundColor:[UIColor lightGrayColor]];
    viewController2.tabBarItem.title = @"News";
    [viewController2 setEdgesForExtendedLayout:UIRectEdgeNone];
    
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewLayout.minimumLineSpacing = 10;
    collectionViewLayout.minimumInteritemSpacing = 10;
    collectionViewLayout.itemSize = CGSizeMake(rootViewController.view.frame.size.width, rootViewController.view.frame.size.width/16*9+GTVideoToobarHeight);
    GTVideoViewController *viewController3 = [[GTVideoViewController alloc] initWithCollectionViewLayout:collectionViewLayout];
    [viewController3.collectionView registerClass:[GTVideoCoverView class] forCellWithReuseIdentifier:@"GTVideoCoverView"];
    [viewController3.collectionView setBackgroundColor:[UIColor lightGrayColor]];
    viewController3.collectionView.delegate = viewController3;
    viewController3.collectionView.dataSource = viewController3;
    viewController3.tabBarItem.title = @"Video";
    [viewController3 setEdgesForExtendedLayout:UIRectEdgeNone];

    
    UIViewController *viewController4 = [[GTRecommendViewController alloc] init];

    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.delegate = self;
    [tabBarController setViewControllers:@[viewController1, viewController2, viewController3, viewController4]];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    [self.window addSubview:({
        [[GTSplashView alloc] initWithFrame:self.window.bounds];
    })];
    [[GTLocation locationManager] checkLocationAuthorization];
    [[GTNotification notificationManager] checkNotificationAuthorization];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

- (void) _changeIcon {
    if ([UIApplication sharedApplication].supportsAlternateIcons) {
        [[UIApplication sharedApplication] setAlternateIconName:@"ICONBLACK" completionHandler:^(NSError * _Nullable error) {
                    NSLog(@"Icon changed");
        }];
    }
}

@end
