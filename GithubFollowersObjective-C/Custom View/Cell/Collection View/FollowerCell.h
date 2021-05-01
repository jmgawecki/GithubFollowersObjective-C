//
//  FollowerCell.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 01/05/2021.
//

#import <UIKit/UIKit.h>
#import "GFAvatarImageView.h"
#import "GFTitleLabel.h"
#import "Follower.h"
#import "NetworkManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface FollowerCell : UICollectionViewCell

@property (class) NSString *reuseID;

@property GFAvatarImageView *avatarImageView;
@property GFTitleLabel *usernameLabel;

@property NetworkManager *sharedManager;

-(void)setOnFollower:(Follower*)follower;


@end

NS_ASSUME_NONNULL_END
