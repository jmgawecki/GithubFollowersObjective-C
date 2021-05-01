//
//  Follower.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 01/05/2021.
//

#import "Follower.h"

@implementation Follower

- (instancetype)initWithLogin:(NSString *)login andAvatarUrl:(NSString *)avatarUrl {
    if (self = [super init]) {
        self.login      = login;
        self.avatarUrl  = avatarUrl;
    }
    return self;
}

@end
