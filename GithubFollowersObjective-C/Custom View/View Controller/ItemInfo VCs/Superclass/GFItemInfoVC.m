//
//  GFItemInfoVC.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import "GFItemInfoVC.h"

@interface GFItemInfoVC ()

@end

@implementation GFItemInfoVC


// MARK: - Initialize

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
    [self instantiatieUIElements];
    [self configureStackView];
    [self layoutUI];
    [self configureActionButton];
}


-(instancetype)initWithUser:(User *)user andWithFollower:(Follower *)follower {
    if (self = [super init]) {
        self.user                   = user;
        self.follower               = follower;
    }
    return self;
}

// MARK: - Action function

-(void)actionButtonTapped {}


// MARK: - VC Configuration

-(void)configure {
    self.view.layer.cornerRadius    = 18;
    self.view.backgroundColor       = [UIColor systemBackgroundColor];
}

-(void)instantiatieUIElements {
    self.actionButton               = [[GFButton alloc] init];
    self.stackView                  = [[UIStackView alloc] init];
    
    self.itemInfoViewOne            = [[GFItemInfoView alloc] init];
    self.itemInfoViewTwo            = [[GFItemInfoView alloc] init];
}


// MARK: - UI Configuration


-(void)configureStackView {
    self.stackView.axis             = UILayoutConstraintAxisHorizontal;
    self.stackView.distribution     = UIStackViewDistributionEqualSpacing;
    
    [self.stackView addArrangedSubview:self.itemInfoViewOne];
    [self.stackView addArrangedSubview:self.itemInfoViewTwo];
}


-(void)configureActionButton {
    [self.actionButton addTarget:self action:@selector(actionButtonTapped) forControlEvents:UIControlEventTouchUpInside];
}


-(void)layoutUI {
    [self.view addSubview:self.actionButton];
    [self.view addSubview:self.stackView];
    
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGFloat padding = 20;
    
    [NSLayoutConstraint activateConstraints:@[
       [self.stackView.topAnchor            constraintEqualToAnchor:self.view.topAnchor constant:padding],
       [self.stackView.leadingAnchor        constraintEqualToAnchor:self.view.leadingAnchor constant:padding],
       [self.stackView.trailingAnchor       constraintEqualToAnchor:self.view.trailingAnchor constant:-padding],
       [self.stackView.heightAnchor         constraintEqualToConstant:50],
       
       [self.actionButton.bottomAnchor      constraintEqualToAnchor:self.view.bottomAnchor constant:-padding],
       [self.actionButton.leadingAnchor     constraintEqualToAnchor:self.view.leadingAnchor constant:padding],
       [self.actionButton.trailingAnchor    constraintEqualToAnchor:self.view.trailingAnchor constant:-padding],
       [self.actionButton.heightAnchor      constraintEqualToConstant:44],
    ]];
}


@end
