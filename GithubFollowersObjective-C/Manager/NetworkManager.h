//
//  NetworkManager.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 30/04/2021.
//

#import <UIKit/UIKit.h>
#import "Follower.h"

@interface NetworkManager : NSObject {
    NSString *someProperty;
}

@property (nonatomic, retain) NSString *someProperty;
@property NSCache<NSString *, UIImage *> *cache;

+ (id)sharedManager;

-(void)getFollowersOf:(NSString*)user atPage:(NSNumber*)page completion:(void (^)(NSMutableArray*))follower;
-(UIImage*)downloadImageFromUrl:(NSString*)avatarUrl;

@end
