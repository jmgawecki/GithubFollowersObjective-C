//
//  NetworkManager.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 30/04/2021.
//

#import <UIKit/UIKit.h>
#import "Follower.h"
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject {
    NSString *someProperty;
}

@property (nonatomic, retain) NSString *someProperty;
@property NSCache *cache;

+ (NetworkManager *)sharedManager;
-(void)getFollowersOf:(NSString*)user
               atPage:(int)page
        completionURL:(void (^)(NSMutableArray* _Nullable followers, NSString* _Nullable error))completion;


-(UIImage*)downloadImageFromUrl:(NSString*)avatarUrl;


-(void)getUserInfoFor:(NSString*)username
       withCompletion:(void (^)(User* _Nullable user, NSString* _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
