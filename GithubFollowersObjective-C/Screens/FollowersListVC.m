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

- (instancetype)initWithUsername:(NSString *)username andWithFollowers:(nonnull NSMutableArray *)followers {
    if (self = [super init]) {
        self.username = username;
        self.title = username;
        /// For some reason, this declaration made it impossible to read and it just did not work
//        self.followersArray = [[NSMutableArray alloc] initWithObjects:followers, nil];
        /// Correct way of doing so
        /// But is there any better?
        self.followersArray = [NSMutableArray new];
        self.followersArray = followers;
        self.page           = 1;
        self.hasMoreFollowers = YES;
        
        self.sharedManager = [NetworkManager sharedManager];
        Follower *test = [self.followersArray firstObject];
        
        NSLog(@"%@", test.login);
        
        
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
    [self.view addSubview:self.followersCollectionView];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.followersCollectionView.backgroundColor        = [UIColor systemBackgroundColor];
//    [self.followersCollectionView registerNib:FollowerCell.self forCellWithReuseIdentifier:@"FollowerCell"];
    [self.followersCollectionView registerClass:FollowerCell.self forCellWithReuseIdentifier:@"FollowerCell"];
    self.followersCollectionView.delegate               = self;
    self.followersCollectionView.dataSource             = self;
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



// MARK: - UICollectionView Delegate


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSLog(@"numberOfSectionsInCollectionView executed");
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"numberOfItemsInSection executed");
    return self.followersArray.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForItemAtIndexPath executed");
    FollowerCell *cell = [self.followersCollectionView dequeueReusableCellWithReuseIdentifier:@"FollowerCell" forIndexPath:indexPath];
    Follower *follower = [self.followersArray objectAtIndex:indexPath.item];
    [cell setOnFollower:follower];
    return cell;
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat offSetY         = scrollView.contentOffset.y;
    CGFloat contentHeight   = scrollView.contentSize.height;
    CGFloat height          = scrollView.frame.size.height;
    
    if (offSetY > contentHeight - height) {
        // add guard for if has more followers
        self.page += 1;
        if (self.hasMoreFollowers) {
            [self.sharedManager getFollowersOf:self.username atPage:self.page completionURL:^(NSMutableArray *followers, NSString *error) {
                __weak typeof(self) weakSelf = self;
                if ([followers count] < 100) {
                    self.hasMoreFollowers = NO;
                }
                if (error) {
                    NSLog(@"%@", error);
                } else {
                    [weakSelf.followersArray addObjectsFromArray:followers];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [weakSelf.followersCollectionView reloadData];
                    });
                    
                }
            }];
        }
    }
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Follower* follower = [self.followersArray objectAtIndex:indexPath.item];
    [self.sharedManager getUserInfoFor:follower.login withCompletion:^(User *user, NSString *error) {
        __weak typeof(self) weakSelf = self;
        if (error != nil) {
            NSLog(@"%@", error);
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.navigationController presentViewController:[[UserInfoVC alloc] initWithUser:user andWithFollower:follower] animated:YES completion:nil];
            });
        }
    }];
    
}





@end
