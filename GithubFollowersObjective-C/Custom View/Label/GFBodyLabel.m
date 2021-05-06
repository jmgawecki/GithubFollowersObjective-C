//
//  GFBodyLabel.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import "GFBodyLabel.h"

@implementation GFBodyLabel

// MARK: - Configure

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configure];
    }
    return self;
}


-(instancetype)initWithAlignment:(NSTextAlignment)textAlignment {
    if (self = [super init]) {
        [self configure];
    }
    return self;
}


-(void)configure {
    self.textColor              = [UIColor secondaryLabelColor];
    self.font                   = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
    self.minimumScaleFactor     = 0.75;
    self.lineBreakMode          = NSLineBreakByWordWrapping;
    
    self.adjustsFontSizeToFitWidth                  = YES;
    self.translatesAutoresizingMaskIntoConstraints  = NO;
}
@end
