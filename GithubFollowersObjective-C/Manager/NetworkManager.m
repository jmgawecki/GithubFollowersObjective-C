//
//  NetworkManager.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 30/04/2021.
//

#import "NetworkManager.h"

@implementation NetworkManager

@synthesize someProperty;

#pragma Singleton methods

+ (id)sharedManager {
    static NetworkManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(id)init {
    if (self = [super init]) {
        someProperty = @"Default Property Value";
    }
    return self;
}


-(NSMutableArray*)getFollowersOf:(NSString*)user atPage:(NSNumber*)page completion:(Follower*)follower {
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/followers?per_page=100&page=%@", user, page];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
    
    if (error != nil) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    // Decodes the NSData into an array of dictionaries
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error != nil) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    NSMutableArray* jsonArray = [NSMutableArray new];
    
    // loop through each dictionary in the array
    for (NSDictionary *entry in json) {
        // pull interesting data into variables
        [jsonArray addObject:[[Follower alloc] initWithLogin:entry[@"login"]
                                                andAvatarUrl:entry[@"avatar_url"]]];
    }
    
    return jsonArray;
}


@end
