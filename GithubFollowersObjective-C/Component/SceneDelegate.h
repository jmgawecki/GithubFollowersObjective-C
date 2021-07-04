//
//  SceneDelegate.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import <UIKit/UIKit.h>
#import "SearchVC.h"
#import "GHTabbarController.h"
#import "NetworkManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic, nullable) UIWindow * window;
@property (strong, nonatomic) GHTabbarController *tabBarController;
@property (strong, nonatomic) SearchVC *viewController;
@end

NS_ASSUME_NONNULL_END

