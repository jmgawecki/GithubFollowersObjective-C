//
//  SearchVC.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import "SearchVC.h"


@interface SearchVC ()

@end

@implementation SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureVC];
    [self instantiatieUIElements];
    [self configureUIElements];
    [self layoutUI];
    [self dismissKeyboardTapGesture];
    [self configureSearchButton];
    
}

// MARK: - VC Configuration


- (void)configureVC {
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    self.navigationController.navigationBar.prefersLargeTitles = NO;
    self.navigationController.navigationBarHidden = YES;
}


- (void)dismissKeyboardTapGesture {
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(endEditing:)];
    [self.view addGestureRecognizer:tap];
}


// MARK: - Perform action


-(void)searchButtonTapped {
    if ([self.searchTextField.text  isEqual: @""]) {
        NSLog(@"Username is empty!");
    } else {
        self.followersArray = [NSMutableArray new];
        [self.loadingVC showLoadingViewOnTheView:self.view];
        [self.sharedManager getFollowersOf:self.searchTextField.text atPage:1 completionURL:^(NSMutableArray *followers, NSString *error) {
            if (followers == nil) {
                NSLog(@"%@", error);
            } else {
                // Weak self looks like this
                __weak typeof(self) weakSelf = self;
                dispatch_async(dispatch_get_main_queue(), ^{
                    // To avoid retain cycle:
                    weakSelf.followersArray = followers;

                    [weakSelf.navigationController pushViewController:[[FollowersListVC alloc]
                                                                   initWithUsername:self.searchTextField.text
                                                                   andWithFollowers:self.followersArray]
                                                         animated:YES];
                    [weakSelf.loadingVC dismissLoadingView];
                });
            }
        }];
    }
}


-(void)configureSearchButton {
    [self.searchButton addTarget:self action:@selector(searchButtonTapped) forControlEvents:UIControlEventTouchUpInside];
}


// MARK: - Layout UI

- (void)instantiatieUIElements {
    self.logoImageView              = [[UIImageView alloc] init];
    self.searchTextField            = [[GFTextField alloc] init];
    self.searchTextField.delegate   = self;
    self.searchButton               = [[GFButton alloc] initWithMessage:@"Search user"
                                                   withBackgroundColour:[UIColor systemGreenColor]];
    self.sharedManager = [NetworkManager sharedManager];
    self.loadingVC = [[GFLoadingVC alloc] init];
}


- (void)configureUIElements {
    self.logoImageView.image = [UIImage imageNamed:@"gh-logo"];
}


- (void)layoutUI {
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.searchTextField];
    [self.view addSubview:self.searchButton];
    
    self.logoImageView.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.logoImageView.topAnchor           constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:80],
        [self.logoImageView.centerXAnchor       constraintEqualToAnchor:self.view.centerXAnchor],
        [self.logoImageView.heightAnchor        constraintEqualToConstant:150],
        [self.logoImageView.widthAnchor         constraintEqualToAnchor:self.logoImageView.heightAnchor],
        
        [self.searchTextField.topAnchor         constraintEqualToAnchor:self.logoImageView.bottomAnchor constant:48],
        [self.searchTextField.leadingAnchor     constraintEqualToAnchor:self.view.leadingAnchor constant:50],
        [self.searchTextField.trailingAnchor    constraintEqualToAnchor:self.view.trailingAnchor constant:-50],
        [self.searchTextField.heightAnchor      constraintEqualToConstant:50],
        
        [self.searchButton.bottomAnchor         constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-50],
        [self.searchButton.leadingAnchor        constraintEqualToAnchor:self.view.leadingAnchor constant:50],
        [self.searchButton.trailingAnchor       constraintEqualToAnchor:self.view.trailingAnchor constant:-50],
        [self.searchButton.heightAnchor         constraintEqualToConstant:50],
    ]];
}


// MARK: - UITextField Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self searchButtonTapped];
    return NO;
}


@end
