//
//  UserInfoVC.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "GFBodyLabel.h"
#import "Follower.h"
#import "User.h"
#import "GFRepoItemVC.h"
#import "GFFollowerItemVC.h"
#import "GFUserInfoHeaderVC.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UserInfoVCDelegate <NSObject>

- (void)didRequestFollowersForUsername:(NSString *)username;

@end

@interface UserInfoVC : UIViewController <GFRepoItemVCDelegate, GFFollowerItemVCDelegate>

@property (nonatomic)UIView             *headerView;
@property (nonatomic)UIView             *itemViewOne;
@property (nonatomic)UIView             *itemViewTwo;
@property (nonatomic)GFBodyLabel        *dateLabel;

@property (nonatomic)GFUserInfoHeaderVC *headerVC;
@property (nonatomic)GFRepoItemVC       *repoItemVC;
@property (nonatomic)GFFollowerItemVC   *followerItemVC;

@property NSString  *username;
@property Follower  *follower;
@property User      *user;

@property (nonatomic, weak) id<UserInfoVCDelegate>delegate;

- (instancetype)initWithUser:(User*)user andWithFollower:(Follower*)follower andWithDelegate:(id<UserInfoVCDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
