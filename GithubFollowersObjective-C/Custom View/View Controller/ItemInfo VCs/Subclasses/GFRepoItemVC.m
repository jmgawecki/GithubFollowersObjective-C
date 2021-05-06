//
//  GFRepoItemVC.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import "GFRepoItemVC.h"

@interface GFRepoItemVC ()

@end

@implementation GFRepoItemVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureItems];
}

- (instancetype)initWithUser:(User *)user andWithDelegate:(id<GFRepoItemVCDelegate>)delegate {
    if (self = [super init]) {
        self.user       = user;
        self.delegate   = delegate;
    }
    return self;
}

- (void)configureItems {
    [self.itemInfoViewOne setItemInfoType:repos withCount:self.user.publicRepos];
    [self.itemInfoViewTwo setItemInfoType:gists withCount:self.user.publicGists];
    [self.actionButton setWithBackgroundColour:[UIColor systemPurpleColor] andWithTitle:@"GitHub Profile"];
}

- (void)actionButtonTapped {
    [self.delegate didTapGitHubProfileForUser:self.user];
}

@end
