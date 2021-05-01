//
//  NetworkManager.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 30/04/2021.
//

#import <foundation/Foundation.h>
#import "Follower.h"

@interface NetworkManager : NSObject {
    NSString *someProperty;
}

@property (nonatomic, retain) NSString *someProperty;
+ (id)sharedManager;

-(void)getFollowersOf:(NSString*)user atPage:(NSNumber*)page completion:(void (^)(NSMutableArray*))follower;

@end
