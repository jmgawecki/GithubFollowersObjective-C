//
//  GFButton.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import "GFButton.h"

@implementation GFButton


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configure];
    }
    return self;
}


- (instancetype)initWithMessage:(NSString *)message withBackgroundColour:(UIColor *)backgroundColour {
    if (self = [super init]) {
        [self setTitle:message forState:normal];
        self.backgroundColor    = backgroundColour;
        [self configure];
    }
    return self;
}


// MARK: - Configuration

- (void)configure {
    self.layer.cornerRadius     = 10;
    self.titleLabel.textColor   = [UIColor whiteColor];
    self.titleLabel.font        = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.translatesAutoresizingMaskIntoConstraints = NO;
}


// MARK: - Called outside

-(void)setWithBackgroundColour:(UIColor*)backgroundColour andWithTitle:(NSString*)title {
    self.backgroundColor = backgroundColour;
    [self setTitle:title forState:normal];
}

@end
