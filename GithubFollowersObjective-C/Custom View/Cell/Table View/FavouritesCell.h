//
//  FavouritesCell.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import <UIKit/UIKit.h>
#import "GFAvatarImageView.h"
#import "GFTitleLabel.h"
#import "Follower.h"

NS_ASSUME_NONNULL_BEGIN

@interface FavouritesCell : UITableViewCell

@property (class) NSString  *reuseID;

@property GFAvatarImageView *avatarImageView;
@property GFTitleLabel      *usernameLabel;

-(void)setOnFollower:(Follower *)follower;


@end

NS_ASSUME_NONNULL_END
