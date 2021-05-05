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
        NSAssert(self.cache != nil, @"Cache is missing");
        NSLog(@"Cache should be instantiated");
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
        }
        
        // Type cast NSURLResponse to NSHTTPURLRESPONSE
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSInteger statusCode            = (long)[httpResponse statusCode];
        NSLog(@"Status code is: %ld", (long)statusCode);
        if (statusCode != 200) {
            completion(nil, error.localizedDescription);
            // HEre is the error
            // Solve it once. To do so. exceed your daily network call limit.
            /*
             *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[NSTaggedPointerString objectForKeyedSubscript:]: unrecognized selector sent to instance 0x9fe3adefb3854d79'
             terminating with uncaught exception of type NSException
             CoreSimulator 757.5 - Device: iPhone 12 mini (F3EB6386-B4C5-4027-9FFA-DCDEF278E4E5) - Runtime: iOS 14.5 (18E182) - DeviceType: iPhone 12 mini
             (lldb)
             */
        }
        
        if (data == nil) {
            completion(nil, error.localizedDescription);
        }
        
        // Decodes the NSData into an array of dictionaries
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error != nil) {
            completion(nil, error.localizedDescription);
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


@end
