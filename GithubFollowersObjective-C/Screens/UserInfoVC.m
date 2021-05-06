//
//  UserInfoVC.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import "UserInfoVC.h"

@interface UserInfoVC ()

@end

@implementation UserInfoVC


// MARK: - Initialize
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureVC];
    [self instantiateUIElements];
    [self configureUIElements];
    [self layoutUI];
}


- (instancetype)initWithUser:(User *)user andWithFollower:(Follower*)follower {
    if (self = [super init]) {
        self.user = user;
        self.follower = follower;
        NSLog(@"%@", user.avatarUrl);
        NSLog(@"%@", user.bio); // nil check
        NSLog(@"%@", user.createdAt);
        NSLog(@"%@", user.followers);
        NSLog(@"%@", user.following);
        NSLog(@"%@", user.htmlUrl);
        NSLog(@"location %@", user.location); // nil check
        NSLog(@"login %@", user.login);
        NSLog(@"name %@", user.name); // nil check
        NSLog(@"%@", user.publicGists);
        NSLog(@"%@", user.publicRepos); 
    }
    return self;
}


// MARK: - VC Configuration


- (void)configureVC {
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}


- (void)instantiateUIElements {
    self.headerView     = [[UIView alloc] init];
    self.itemViewOne    = [[UIView alloc] init];
    self.itemViewTwo    = [[UIView alloc] init];
    
    self.dateLabel      = [[GFBodyLabel alloc] initWithAlignment:NSTextAlignmentCenter];
    
    self.headerVC       = [[GFUserInfoHeaderVC alloc] initWithUser:self.user];
    self.repoItemVC     = [[GFRepoItemVC alloc] initWithUser:self.user andWithDelegate:self];
    self.followerItemVC = [[GFFollowerItemVC alloc] initWithUser:self.user andWithDelegate:self];
    
}


// MARK: - Action functions

-(void)dismissVC {
    [self dismissVC];
}


// MARK: - Layout Configuration


-(void)configureUIElements {
    [self addChildVC:self.headerVC toContainerView:self.headerView];
    [self addChildVC:self.repoItemVC toContainerView:self.itemViewOne]; 
    [self addChildVC:self.followerItemVC toContainerView:self.itemViewTwo];
    self.dateLabel.text = self.user.createdAt;
}


-(void)addChildVC:(UIViewController*)childVC toContainerView:(UIView*)containerView {
    [self addChildViewController:childVC];
    [containerView addSubview:childVC.view];
    childVC.view.frame = containerView.bounds;
    [childVC didMoveToParentViewController:self];
}


- (void)layoutUI {
    NSArray<UIView*>* uiViewArray = @[self.headerView, self.itemViewOne, self.itemViewTwo, self.dateLabel];
    
    for (UIView *views in uiViewArray) {
        [self.view addSubview:views];
        views.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    CGFloat padding = 20;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.headerView.topAnchor          constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [self.headerView.leadingAnchor      constraintEqualToAnchor:self.view.leadingAnchor],
        [self.headerView.trailingAnchor     constraintEqualToAnchor:self.view.trailingAnchor],
        [self.headerView.heightAnchor       constraintEqualToConstant:180],
        
        [self.itemViewOne.topAnchor         constraintEqualToAnchor:self.headerView.bottomAnchor constant:padding],
        [self.itemViewOne.leadingAnchor     constraintEqualToAnchor:self.view.leadingAnchor constant:padding],
        [self.itemViewOne.trailingAnchor    constraintEqualToAnchor:self.view.trailingAnchor constant:-padding],
        [self.itemViewOne.heightAnchor      constraintEqualToConstant:140],
        
        [self.itemViewTwo.topAnchor         constraintEqualToAnchor:self.itemViewOne.bottomAnchor constant:padding],
        [self.itemViewTwo.leadingAnchor     constraintEqualToAnchor:self.view.leadingAnchor constant:padding],
        [self.itemViewTwo.trailingAnchor    constraintEqualToAnchor:self.view.trailingAnchor constant:-padding],
        [self.itemViewTwo.heightAnchor      constraintEqualToConstant:140],
        
        [self.dateLabel.topAnchor           constraintEqualToAnchor:self.itemViewTwo.bottomAnchor constant:padding],
        [self.dateLabel.leadingAnchor       constraintEqualToAnchor:self.view.leadingAnchor constant:padding],
        [self.dateLabel.trailingAnchor      constraintEqualToAnchor:self.view.trailingAnchor constant:-padding],
        [self.dateLabel.heightAnchor        constraintEqualToConstant:18],
    ]];
}

- (void)didTapGetFollowersForUser:(User *)user {
    NSLog(@"Success!");
}

- (void)didTapGitHubProfileForUser:(User *)user {
    NSLog(@"Success too!");
}


@end
