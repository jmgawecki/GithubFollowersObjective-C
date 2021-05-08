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
        self.cache = [[NSCache alloc] init];
    }
    return self;
}

/// OLD WAY
//-(void)getFollowersOf:(NSString*)user atPage:(NSNumber*)page completion:(void (^)(NSMutableArray*))completion  {
//    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/followers?per_page=100&page=%@", user, page];
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
//    NSMutableArray* jsonArray = [NSMutableArray new];
//
//    // loop through each dictionary in the array
//    for (NSDictionary *entry in json) {
//        // pull interesting data into variables
//        [jsonArray addObject:[[Follower alloc] initWithLogin:entry[@"login"]
//                                                andAvatarUrl:entry[@"avatar_url"]]];
//    }
//
//    completion(jsonArray);
//}

-(void)getFollowersOf:(NSString*)user atPage:(int)page completionURL:(void (^)(NSMutableArray*, NSString*))completion {
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/followers?per_page=100&page=%d", user, page];
    NSURL *url          = [NSURL URLWithString:urlString];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error != nil) {
            completion(nil, error.localizedDescription);
            return;
        }
        
        // Type cast NSURLResponse to NSHTTPURLRESPONSE
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSInteger statusCode            = (long)[httpResponse statusCode];
        NSLog(@"Status code is: %ld", (long)statusCode);
        if (statusCode != 200) {
            NSLog(@"%@", error.localizedDescription);
            completion(nil, error.localizedDescription);
            return;
        }
        
        if (data == nil) {
            completion(nil, error.localizedDescription);
            return;
        }
        
        // Decodes the NSData into an array of dictionaries
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error != nil) {
            completion(nil, error.localizedDescription);
            return;
        }
//        NSLog(@"json counter is: %lu", (unsigned long)[json count]);
        NSMutableArray* jsonArray = [NSMutableArray new];
        
        // loop through each dictionary in the array
        for (NSDictionary *entry in json) {
            // pull interesting data into variables
            [jsonArray addObject:[[Follower alloc] initWithLogin:entry[@"login"]
                                                    andAvatarUrl:entry[@"avatar_url"]]];
        }
        
        completion(jsonArray, nil);
    }];
    [task resume];
}


-(UIImage*)downloadImageFromUrl:(NSString*)avatarUrl {
    
    NSString *cacheKey = [NSString stringWithFormat:@"%@", avatarUrl];
    
    UIImage *image = [self.cache objectForKey:cacheKey];
    
    if (image != nil) {
        NSLog(@"Cache image found");
        return image;
    } else {
        NSLog(@"Cache image not found");
    }
    
    NSString *urlString = [NSString stringWithFormat:@"%@", avatarUrl];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:url options: NSDataReadingUncached error:&error];
    
    if (error != nil) {
        
    }
    
    image = [UIImage imageWithData:data];
    [self.cache setObject:image forKey:cacheKey];
    
    return image;
}

-(void)getUserInfoFor:(NSString*)username withCompletion:(void (^)(User*, NSString*))completion {
    NSString* urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@", username];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSessionDataTask* dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            completion(nil, error.localizedDescription);
            return;
        }
        // Typcasting NSURLResponse to NSHTTPURLResponse
        // NSHTTPURLResponse is a subclass of NSURLResponse
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSInteger statusCode = httpResponse.statusCode;
        if (statusCode != 200) {
            completion(nil, error.localizedDescription);
            return;
        }
        
        if (data == nil) {
            completion(nil, error.localizedDescription);
            return;
        }
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (error != nil) {
            completion(nil, error.localizedDescription);
            return;
        }
        
        User* user = [[User alloc] initWithLogin:json[@"login"]
                                       avatarURL:json[@"avatar_url"]
                                            name:[self valueOrNil:json[@"name"]]
                                        location:[self valueOrNil:json[@"location"]]
                                             bio:[self valueOrNil:json[@"bio"]]
                                     publicRepos:json[@"public_repos"]
                                     publicGists:json[@"public_gists"]
                                         htmlUrl:json[@"html_url"]
                                       followers:json[@"followers"]
                                       following:json[@"following"]
                                       createdAt:json[@"created_at"]];
        NSLog(@"%@", user);
        completion(user, nil);
    }];
    [dataTask resume];
}

// Call this method on every bit of JSON you're converting to Objective-C. This will either return the right value or return nil. I'm using this as a static method, but you can also make a category on NSDictionary, if you prefer that.
- (id)valueOrNil:(id)value {
    if ([value isMemberOfClass:[NSNull class]]) {
        return nil;
    }
    return value;
}


@end
