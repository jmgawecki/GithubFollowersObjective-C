//
//  UIViewController+Ext.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 06/05/2021.
//

#import "UIViewController+Ext.h"


@implementation UIViewController (UIViewControllerExtension)
- (void)presentSafariVCWithURL:(NSURL *)url {
    SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:url];
    safariVC.preferredControlTintColor = [UIColor systemGreenColor];
    [self presentViewController:safariVC animated:YES completion:nil];
}
@end
