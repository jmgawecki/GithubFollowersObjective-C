//
//  GFAvatarImageView.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import "GFAvatarImageView.h"

@implementation GFAvatarImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configure];
        [self instantiateUIElements];
        [self configureUIElements];
    }
    return self;
}


// MARK: - Configuration


-(void)configure {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.layer.cornerRadius = 16;
    self.clipsToBounds = YES;
    self.image = self.avatarPlaceholder;
}


-(void)instantiateUIElements {
    self.avatarPlaceholder = [[UIImage alloc] init];
}

-(void)configureUIElements {
    self.avatarPlaceholder = [UIImage imageNamed:@"avatar-placeholder"];
}

@end
