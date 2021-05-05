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
@property NSCache *cache;

+ (id)sharedManager;

-(void)getFollowersOf:(NSString*)user atPage:(int)page completionURL:(void (^)(NSMutableArray*, NSString*))completion;
-(UIImage*)downloadImageFromUrl:(NSString*)avatarUrl;

@end
