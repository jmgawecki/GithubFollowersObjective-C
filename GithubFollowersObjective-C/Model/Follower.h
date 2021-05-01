//
//  Follower.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 01/05/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Follower : NSObject

@property NSString *login;
@property NSString *avatarUrl;

- (instancetype)initWithLogin:(NSString*)login andAvatarUrl:(NSString*)avatarUrl;

@end

NS_ASSUME_NONNULL_END
