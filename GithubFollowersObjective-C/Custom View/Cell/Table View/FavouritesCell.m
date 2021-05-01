//
//  FavouritesCell.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import "FavouritesCell.h"


@implementation FavouritesCell
// MARK: - Static
static NSString *_reuseID = nil;

+ (NSString*)reuseID {
    return _reuseID;
}

+ (void)setReuseID:(NSString *)reuseID {
    _reuseID = reuseID;
}


// MARK: - Initialise and Instantiate


- (void)awakeFromNib {
    [super awakeFromNib];
    [self instantiateUIElements];
    [self configureFollowerCell];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





// MARK: - Called outside

-(void)setOnFollower:(Follower *)follower {
    
}


// MARK: - Layout configuration

-(void)instantiateUIElements {
    self.avatarImageView    = [[GFAvatarImageView alloc] init];
    self.usernameLabel      = [[GFTitleLabel alloc] init];
}

-(void)configureFollowerCell {
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.usernameLabel];
    
    [NSLayoutConstraint activateConstraints:@[
       [self.avatarImageView.topAnchor          constraintEqualToAnchor:self.contentView.topAnchor constant:8],
       [self.avatarImageView.leadingAnchor      constraintEqualToAnchor:self.contentView.leadingAnchor constant:8],
       [self.avatarImageView.trailingAnchor     constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8],
       [self.avatarImageView.heightAnchor       constraintEqualToAnchor:self.avatarImageView.widthAnchor],
       
       [self.usernameLabel.topAnchor            constraintEqualToAnchor:self.avatarImageView.bottomAnchor constant:12],
       [self.usernameLabel.leadingAnchor        constraintEqualToAnchor:self.contentView.leadingAnchor constant:8],
       [self.usernameLabel.trailingAnchor       constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8],
       [self.usernameLabel.heightAnchor         constraintEqualToConstant:20],
       
    ]];
}



@end
