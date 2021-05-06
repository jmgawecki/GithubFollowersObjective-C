//
//  UIViewController+Ext.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 06/05/2021.
//

#import <Foundation/Foundation.h>
#import <SafariServices/SafariServices.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (UIViewControllerExtension)

- (void)presentSafariVCWithURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
