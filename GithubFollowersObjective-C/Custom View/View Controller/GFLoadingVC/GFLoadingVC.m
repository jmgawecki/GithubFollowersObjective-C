//
//  GFLoadingVC.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 06/05/2021.
//

#import "GFLoadingVC.h"

@interface GFLoadingVC ()

@end

@implementation GFLoadingVC

- (void)showLoadingViewOnTheView:(UIView*)motherView; {
    self.containerView = [[UIView alloc] initWithFrame:self.view.bounds];
    [motherView addSubview:self.containerView];
    
    self.containerView.backgroundColor  = [UIColor systemBackgroundColor];
    self.containerView.alpha            = 0;
    
    [UIView animateWithDuration:1 animations:^{
        self.containerView.alpha = 0.75;
    }];
    
     UIActivityIndicatorView *progressView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    [self.containerView addSubview:progressView];
    progressView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [progressView.centerXAnchor constraintEqualToAnchor:self.containerView.centerXAnchor],
        [progressView.centerYAnchor constraintEqualToAnchor:self.containerView.centerYAnchor],
    ]];
    
    [progressView startAnimating];
}

- (void)dismissLoadingView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.containerView removeFromSuperview];
        self.containerView = nil;
    });
}


@end
