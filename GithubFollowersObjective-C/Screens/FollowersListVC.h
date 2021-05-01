//
//  FollowersListVC.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FollowersListVC : UIViewController
@property NSString *username;

-(instancetype)initWithUsername:(NSString*)username;

@end

NS_ASSUME_NONNULL_END
