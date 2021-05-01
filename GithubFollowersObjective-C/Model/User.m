//
//  Follower.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import "User.h"

@implementation User

-(instancetype)initWithLogin:(NSString *)login
                   avatarURL:(NSString *)avatarUrl
                        name:(NSString *)name
                    location:(NSString *)location
                         bio:(NSString *)bio
                 publicRepos:(NSNumber *)publicRepos
                 publicGists:(NSNumber *)publicGists
                     htmlUrl:(NSString *)htmlUrl
                   followers:(NSNumber *)followers
                   following:(NSNumber *)following
                   createdAt:(NSString *)createdAt {
    if (self = [super init]) {
        self.login          = login;
        self.avatarUrl      = avatarUrl;
        self.name           = name;
        self.location       = location;
        self.bio            = bio;
        self.publicRepos    = publicRepos;
        self.publicGists    = publicGists;
        self.htmlUrl        = htmlUrl;
        self.followers      = followers;
        self.following      = following;
        self.createdAt      = createdAt;
    }
    return self;
}

@end
