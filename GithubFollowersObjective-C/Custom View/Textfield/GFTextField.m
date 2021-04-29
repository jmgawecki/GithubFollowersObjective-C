//
//  GFTextField.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import "GFTextField.h"

@implementation GFTextField

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
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.layer.cornerRadius         = 20;
    self.layer.borderWidth          = 2;
    self.layer.borderColor          = [[UIColor systemGray4Color]CGColor];
    
    self.textColor                  = [UIColor labelColor];
    self.tintColor                  = [UIColor labelColor];
    self.textAlignment              = NSTextAlignmentCenter;
    
    self.font                       = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
    self.adjustsFontSizeToFitWidth  = YES;
    self.minimumFontSize            = 12;
    self.backgroundColor            = [UIColor tertiarySystemBackgroundColor];
    self.autocorrectionType         = NO;
    self.placeholder                = @"Enter a username";
    self.returnKeyType              = UIReturnKeySearch;
    
}

@end
