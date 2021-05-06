//
//  GFLoadingVC.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 06/05/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GFLoadingVC : UIViewController

@property (nonatomic, nullable) UIView *containerView;

- (void)showLoadingViewOnTheView:(UIView*)motherView;
- (void)dismissLoadingView;


@end

NS_ASSUME_NONNULL_END
