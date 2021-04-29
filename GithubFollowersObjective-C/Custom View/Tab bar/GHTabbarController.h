//
//  GHTabbarController.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import <UIKit/UIKit.h>
#import "SearchVC.h"
#import "FavouritesVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface GHTabbarController : UITabBarController

@property (strong, nonatomic, nullable) SearchVC *searchVC;
@property (strong, nonatomic, nullable) FavouritesVC *favouritesVC;

@end

NS_ASSUME_NONNULL_END
