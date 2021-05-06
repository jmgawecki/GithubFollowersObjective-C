//
//  GFSecondaryTitleLabel.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import "GFSecondaryTitleLabel.h"

@implementation GFSecondaryTitleLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configure];
    }
    return self;
}

// MARK: - Configuration

- (void)configure {
    self.translatesAutoresizingMaskIntoConstraints  = NO;
    self.adjustsFontSizeToFitWidth                  = YES;
    
    self.minimumScaleFactor = 0.9;
    self.lineBreakMode      = NSLineBreakByTruncatingTail;
    self.textColor          = [UIColor secondaryLabelColor];
}
@end
