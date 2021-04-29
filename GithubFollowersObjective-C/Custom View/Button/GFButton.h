//
//  GFButton.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GFButton : UIButton
@property NSString *message;
@property UIColor *color;


- (instancetype)initWithMessage:(NSString *)message withBackgroundColour:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
