//
//  GFUserInfoHeaderVC.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import <UIKit/UIKit.h>
#import "GFAvatarImageView.h"
#import "GFTitleLabel.h"
#import "GFSecondaryTitleLabel.h"
#import "GFBodyLabel.h"
#import "User.h"
#import "NetworkManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface GFUserInfoHeaderVC : UIViewController

@property (nonatomic) GFAvatarImageView     *avatarImgV;
@property (nonatomic) GFTitleLabel          *usernameLabel;
@property (nonatomic) GFSecondaryTitleLabel *nameLabel;
@property (nonatomic) UIImageView           *locationImgV;
@property (nonatomic) GFSecondaryTitleLabel *locationLabel;
@property (nonatomic) GFBodyLabel           *bioLabel;

@property NetworkManager *sharedManager;

@property User *user;

- (instancetype)initWithUser:(User*)user;

@end

NS_ASSUME_NONNULL_END
