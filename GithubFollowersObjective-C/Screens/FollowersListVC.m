//
//  FollowersListVC.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import "FollowersListVC.h"

@interface FollowersListVC ()

@end

@implementation FollowersListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureVC];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}

- (instancetype)initWithUsername:(NSString *)username {
    if (self = [super init]) {
        self.username = username;
        self.title = username;
    }
    return self;
}


- (void)configureVC {
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}



@end
