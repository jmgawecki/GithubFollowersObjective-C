//
//  NetworkManager.m
//  GithubFollowersObjective-CTests
//
//  Created by Jakub Gawecki on 30/04/2021.
//

#import <XCTest/XCTest.h>
#import "Follower.h"

@interface NetworkManagerTests : XCTestCase

@end

@implementation NetworkManagerTests

-(void)testGetFollowersOf {
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/sallen0400/followers"];
    
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
        NSLog(@"pring");
    }
}

-(void)testGetFollowersOfSallen0400ForPage1 {
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/sallen0400/followers?per_page=100&page=1"];
    
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
    
    NSLog(@"%@", [json firstObject]);
    
    NSMutableArray* jsonArray = [NSMutableArray new];
    
    // loop through each dictionary in the array
    for (NSDictionary *entry in json) {
        NSLog(@"Printing first entry %@", entry);
        // pull interesting data into variables
        [jsonArray addObject:[[Follower alloc] initWithLogin:entry[@"login"]
                                                andAvatarUrl:entry[@"avatar_url"]]];
    }
}

/// Change to user network call later

//-(void)testGetFollowersOfSallen0400ForPage1 {
//    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/sallen0400/followers?per_page=100&page=1"];
//
//    NSURL *url = [NSURL URLWithString:urlString];
//
//    NSError *error;
//    NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
//
//    if (error != nil) {
//        NSLog(@"%@", [error localizedDescription]);
//    }
//
//    // Decodes the NSData into an array of dictionaries
//    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
//
//    if (error != nil) {
//        NSLog(@"%@", [error localizedDescription]);
//    }
//
//    NSLog(@"%@", [json firstObject]);
//
//    NSMutableArray* jsonArray = [NSMutableArray new];
//
//    // loop through each dictionary in the array
//    for (NSDictionary *entry in json) {
//        NSLog(@"Printing first entry %@", entry);
//        // pull interesting data into variables
//        [jsonArray addObject:[[Follower alloc] initWithLogin:entry[@"login"]
//                                                   avatarURL:entry[@"avatar_url"]
//                                                        name:entry[@"name"]
//                                                    location:entry[@"location"]
//                                                         bio:entry[@"bio"]
//                                                 publicRepos:entry[@"public_repos"]
//                                                 publicGists:entry[@"public_gists"]
//                                                     htmlUrl:entry[@"html_url"]
//                                                   followers:entry[@"followers"]
//                                                   following:entry[@"following"]
//                                                   createdAt:entry[@"created_at"]]];
//    }
//    Follower *loginTestFirstIndex = [jsonArray firstObject];
//
//    NSLog(@"Created at %@", loginTestFirstIndex.createdAt);
//}

@end
