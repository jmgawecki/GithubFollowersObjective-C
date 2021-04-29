//
//  SceneDelegate.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import <UIKit/UIKit.h>
#import "SearchVC.h"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow * window;
@property (strong, nonatomic) SearchVC *viewController;
@end

