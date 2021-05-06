//
//  FollowerCell.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 01/05/2021.
//

#import "FollowerCell.h"

@implementation FollowerCell
static NSString *_reuseID = nil;

+ (NSString*)reuseID {
    return _reuseID;
}

+ (void)setReuseID:(NSString *)reuseID {
    _reuseID = reuseID;
}


// MARK: - Initialise and Instantiate


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self instantiateUIElements];
        [self configureFollowerCell];
    }
    return self;
}


// MARK: - Called outside

- (void)setOnFollower:(Follower *)follower {
    self.usernameLabel.text = follower.login;
    self.avatarImageView.image = [self.sharedManager downloadImageFromUrl:follower.avatarUrl];
}


// MARK: - Configuration


- (void)instantiateUIElements {
    self.avatarImageView    = [[GFAvatarImageView alloc] init];
    CGFloat fontSize        = 16;
    NSTextAlignment center  = NSTextAlignmentCenter;
    self.usernameLabel      = [[GFTitleLabel alloc] initWithTextAlignment:center
                                                              andFontSize:fontSize];
    self.sharedManager = [NetworkManager sharedManager];
}


- (void)configureFollowerCell {
    NSLog(@"Configure Cell executed");
    self.contentView.backgroundColor = [UIColor systemBackgroundColor];
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.usernameLabel];
    
    CGFloat padding = 8;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.avatarImageView.topAnchor         constraintEqualToAnchor:self.contentView.topAnchor constant:padding],
        [self.avatarImageView.leadingAnchor     constraintEqualToAnchor:self.contentView.leadingAnchor constant:padding],
        [self.avatarImageView.trailingAnchor    constraintEqualToAnchor:self.contentView.trailingAnchor constant:-padding],
        [self.avatarImageView.heightAnchor      constraintEqualToAnchor:self.avatarImageView.widthAnchor],
        
        [self.usernameLabel.topAnchor           constraintEqualToAnchor:self.avatarImageView.bottomAnchor constant:12],
        [self.usernameLabel.leadingAnchor       constraintEqualToAnchor:self.contentView.leadingAnchor constant:padding],
        [self.usernameLabel.trailingAnchor      constraintEqualToAnchor:self.contentView.trailingAnchor constant:-padding],
        [self.usernameLabel.heightAnchor        constraintEqualToConstant:20],
    ]];
}


@end
