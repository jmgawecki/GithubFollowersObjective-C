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
    [self configureFollowersCollectionView];
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

// MARK: - Configuration

- (void)configureVC {
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}


- (void)configureFollowersCollectionView {
    self.followersCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                                      collectionViewLayout:[self createThreeColumnLayout]];
    [self.followersCollectionView registerNib:FollowerCell.self forCellWithReuseIdentifier:FollowerCell.reuseID];
}


- (UICollectionViewFlowLayout*)createThreeColumnLayout {
    CGFloat width               = self.view.bounds.size.width;
    CGFloat padding             = 12;
    CGFloat minimumItemSpacing  = 10;
    CGFloat availableWidth      = width - (padding * 2) - (minimumItemSpacing * 2);
    CGFloat itemWidth           = availableWidth / 3;
    
    UICollectionViewFlowLayout *flowLayout  = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset                 = UIEdgeInsetsMake(padding, padding, padding, padding);
    flowLayout.itemSize                     = CGSizeMake(itemWidth, itemWidth + 40);
    
    return flowLayout;
}



// MARK - UICollectionView Delegate



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.followersArray.count;
}


@end
