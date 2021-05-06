//
//  GFFollowerItemVC.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import "GFFollowerItemVC.h"

@interface GFFollowerItemVC ()

@end

@implementation GFFollowerItemVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureItems];
}


- (instancetype)initWithUser:(User *)user andWithDelegate:(id<GFFollowerItemVCDelegate>)delegate {
    if (self = [super init]) {
        self.user       = user;
        self.delegate   = delegate;
    }
    return self;
}


- (void)configureItems {
    [self.itemInfoViewOne setItemInfoType:followers withCount:self.user.followers];
    [self.itemInfoViewTwo setItemInfoType:following withCount:self.user.following];
    [self.actionButton setWithBackgroundColour:[UIColor systemPurpleColor] andWithTitle:@"GitHub Profile"];
}


- (void)actionButtonTapped {
    [self.delegate didTapGetFollowersForUser:self.user];
}

@end
