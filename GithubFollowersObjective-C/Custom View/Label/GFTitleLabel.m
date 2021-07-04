//
//  GFTitleLabel.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import "GFTitleLabel.h"

@implementation GFTitleLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configure];
    }
    return self;
}


- (instancetype)initWithTextAlignment:(NSTextAlignment)textAlignment andFontSize:(CGFloat)fontSize {
    if (self = [super init]) {
        self.textAlignment  = textAlignment;
        self.textAlignment  = NSTextAlignmentLeft;
        self.font           = [UIFont systemFontOfSize:fontSize weight:bold];
        [self configure];
    }
    return self;
}


// MARK: - Configuration


-(void)configure {
    self.textColor                  = [UIColor labelColor];
    self.adjustsFontSizeToFitWidth  = YES;
    self.minimumScaleFactor         = 0.9;
    self.lineBreakMode              = NSLineBreakByTruncatingTail;
    self.translatesAutoresizingMaskIntoConstraints = NO;
}
@end
