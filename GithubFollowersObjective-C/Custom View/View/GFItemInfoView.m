//
//  GFItemInfoView.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import "GFItemInfoView.h"


@implementation GFItemInfoView


// MARK: - Initialize

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self instantiateUIElements];
        [self configure];
    }
    return self;
}


// MARK: - View Configuration

-(void)instantiateUIElements {
    self.symbolImageView = [[UIImageView alloc] init];
    self.titleLabel = [[GFTitleLabel alloc] initWithTextAlignment:NSTextAlignmentLeft andFontSize:14];
    self.countLabel = [[GFTitleLabel alloc] initWithTextAlignment:NSTextAlignmentCenter andFontSize:14];
}

-(void)configure {
    [self addSubview:self.symbolImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.countLabel];
    
    self.symbolImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
       [self.symbolImageView.topAnchor constraintEqualToAnchor:self.topAnchor],
       [self.symbolImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
       [self.symbolImageView.widthAnchor constraintEqualToConstant:20],
       [self.symbolImageView.heightAnchor constraintEqualToAnchor:self.symbolImageView.widthAnchor],
       
       [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.symbolImageView.centerYAnchor],
       [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.symbolImageView.trailingAnchor constant:12],
       [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
       [self.titleLabel.heightAnchor constraintEqualToConstant:18],
       
       [self.countLabel.topAnchor constraintEqualToAnchor:self.symbolImageView.bottomAnchor constant:4],
       [self.countLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
       [self.countLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
       [self.countLabel.heightAnchor constraintEqualToConstant:18],
    ]];
}

// MARK: - Called outside

-(void)setItemInfoType:(ItemInfoType)itemInfoType withCount:(NSNumber*)count {
    switch (itemInfoType) {
        case repos:
            self.symbolImageView.image  = [UIImage systemImageNamed:@"folder.fill"];
            self.titleLabel.text        = @"Public Repos";
            break;
        case gists:
            self.symbolImageView.image  = [UIImage systemImageNamed:@"dpad"];
            self.titleLabel.text        = @"Public Gists";
            break;
        case following:
            self.symbolImageView.image  = [UIImage systemImageNamed:@"rectangle.stack.person.crop"];
            self.titleLabel.text        = @"Following";
            break;
        case followers:
            self.symbolImageView.image  = [UIImage systemImageNamed:@"folder.fill"];
            self.titleLabel.text        = @"Followers";
            break;
    }
    self.countLabel.text = [NSString stringWithFormat:@"%@", count];
}

@end
