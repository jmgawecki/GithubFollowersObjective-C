//
//  GHTabbarController.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import "GHTabbarController.h"

@interface GHTabbarController ()



@end

@implementation GHTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTabBarController];
}

- (void)configureTabBarController {
    self.viewControllers = @[[self createSearchNavigationController], [self createFavouritesNavigationController]];
    UITabBar.appearance.tintColor = [UIColor systemGreenColor];
}

- (UINavigationController *)createSearchNavigationController {
    self.searchVC = [[SearchVC alloc] init];
    self.searchVC.title = @"Search";
    self.searchVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem: UITabBarSystemItemSearch  tag:0];
    return [[UINavigationController alloc] initWithRootViewController:self.searchVC];
}

-(UINavigationController *)createFavouritesNavigationController {
    self.favouritesVC = [[FavouritesVC alloc] init];
    self.favouritesVC.title = @"Favourites";
    self.favouritesVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem: UITabBarSystemItemBookmarks tag:1];
    return [[UINavigationController alloc] initWithRootViewController:self.favouritesVC];
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
