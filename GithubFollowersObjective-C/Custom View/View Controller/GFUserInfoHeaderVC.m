//
//  GFUserInfoHeaderVC.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import "GFUserInfoHeaderVC.h"

@interface GFUserInfoHeaderVC ()

@end

@implementation GFUserInfoHeaderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self instantiateUIElements];
    [self configureUIElements];
    [self addSubviews];
    [self layoutUI];
}


- (instancetype)initWithUser:(User *)user {
    if (self = [super init]) {
        self.user = user;
        self.sharedManager = [NetworkManager sharedManager];
    }
    return self;
}


// MARK: - VC Configuration


- (void)instantiateUIElements {
    self.avatarImgV     = [[GFAvatarImageView alloc] init];
    self.usernameLabel  = [[GFTitleLabel alloc] initWithTextAlignment:NSTextAlignmentLeft andFontSize:34];
    self.nameLabel      = [[GFSecondaryTitleLabel alloc] init];
    self.locationImgV   = [[UIImageView alloc] init];
    self.locationLabel  = [[GFSecondaryTitleLabel alloc] init];
    self.bioLabel       = [[GFBodyLabel alloc] initWithAlignment:NSTextAlignmentLeft];
}


-(void)addSubviews {
    [self.view addSubview:self.avatarImgV];
    [self.view addSubview:self.usernameLabel];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.locationImgV];
    [self.view addSubview:self.locationLabel];
    [self.view addSubview:self.bioLabel];
}


-(void)configureUIElements {
    self.avatarImgV.image   = [self.sharedManager downloadImageFromUrl:self.user.avatarUrl];
    self.usernameLabel.text = self.user.login;
    
    if (self.user.name) {
        self.usernameLabel.text = self.user.name;
    } else {
        self.usernameLabel.text = self.user.login;
    }
    
    if (self.user.location) {
        self.locationLabel.text = self.user.location;
    } else {
        self.locationLabel.text = @"No location available";
    }
    
    if (self.user.bio) {
        self.bioLabel.text = self.user.bio;
    } else {
        self.bioLabel.text = @"No bio available";
    }
    
    self.bioLabel.numberOfLines = 3;
    
    self.locationImgV.image     = [UIImage systemImageNamed:@"mappin.and.ellipse"];
    self.locationImgV.tintColor = [UIColor systemGreenColor];
}


- (void)layoutUI {
    CGFloat padding             = 20;
    CGFloat textImagePadding    = 12;
    
    self.locationImgV.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.avatarImgV.topAnchor          constraintEqualToAnchor:self.view.topAnchor constant:padding],
        [self.avatarImgV.leadingAnchor      constraintEqualToAnchor:self.view.leadingAnchor constant:padding],
        [self.avatarImgV.heightAnchor       constraintEqualToConstant:90],
        [self.avatarImgV.widthAnchor        constraintEqualToAnchor:self.avatarImgV.heightAnchor],
        
        [self.usernameLabel.topAnchor       constraintEqualToAnchor:self.avatarImgV.topAnchor],
        [self.usernameLabel.leadingAnchor   constraintEqualToAnchor:self.avatarImgV.trailingAnchor constant:textImagePadding],
        [self.usernameLabel.trailingAnchor  constraintEqualToAnchor:self.view.trailingAnchor constant:-padding],
        [self.usernameLabel.heightAnchor    constraintEqualToConstant:38],
        
        [self.nameLabel.centerYAnchor       constraintEqualToAnchor:self.avatarImgV.centerYAnchor constant:8],
        [self.nameLabel.leadingAnchor       constraintEqualToAnchor:self.avatarImgV.trailingAnchor constant:textImagePadding],
        [self.nameLabel.trailingAnchor      constraintEqualToAnchor:self.view.trailingAnchor constant:-padding],
        [self.nameLabel.heightAnchor        constraintEqualToConstant:20],
        
        [self.locationImgV.bottomAnchor     constraintEqualToAnchor:self.avatarImgV.bottomAnchor],
        [self.locationImgV.leadingAnchor    constraintEqualToAnchor:self.avatarImgV.trailingAnchor constant:textImagePadding],
        [self.locationImgV.heightAnchor     constraintEqualToConstant:20],
        [self.locationImgV.widthAnchor      constraintEqualToAnchor:self.locationImgV.heightAnchor],
        
        [self.locationLabel.centerYAnchor   constraintEqualToAnchor:self.locationImgV.centerYAnchor],
        [self.locationLabel.leadingAnchor   constraintEqualToAnchor:self.locationImgV.trailingAnchor constant:5],
        [self.locationLabel.trailingAnchor  constraintEqualToAnchor:self.view.trailingAnchor constant:padding],
        [self.locationLabel.heightAnchor    constraintEqualToConstant:20],
        
        [self.bioLabel.topAnchor            constraintEqualToAnchor:self.avatarImgV.bottomAnchor constant:textImagePadding],
        [self.bioLabel.leadingAnchor        constraintEqualToAnchor:self.avatarImgV.leadingAnchor],
        [self.bioLabel.trailingAnchor       constraintEqualToAnchor:self.view.trailingAnchor constant:-padding],
        [self.bioLabel.heightAnchor         constraintEqualToConstant:60],
    ]];
}


// MARK: - Network Call


@end
