//
//  Follower.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property NSString              *login;
@property NSString              *avatarUrl;
@property (nullable) NSString   *name;
@property (nullable) NSString   *location;
@property (nullable) NSString   *bio;
@property NSNumber              *publicRepos;
@property NSNumber              *publicGists;
@property NSString              *htmlUrl;
@property NSNumber              *followers;
@property NSNumber              *following;
@property NSString              *createdAt;


-(instancetype)initWithLogin:(NSString*)login
                   avatarURL:(NSString*)avatarUrl
                        name:(NSString*)name
                    location:(NSString*)location
                         bio:(NSString* )bio
                 publicRepos:(NSNumber*)publicRepos
                 publicGists:(NSNumber*)publicGists
                     htmlUrl:(NSString*)htmlUrl
                   followers:(NSNumber*)followers
                   following:(NSNumber*)following
                   createdAt:(NSString*)createdAt;

@end

NS_ASSUME_NONNULL_END


/*
 struct User: Codable, Hashable, UserProtocol {
     var login:          String
     var avatarUrl:      String
     var name:           String?
     var location:       String?
     var bio:            String?
     var publicRepos:    Int
     var publicGists:    Int
     var htmlUrl:        String
     var followers:      Int
     var following:      Int
     var createdAt:      String
 }
 */
