//
//  SearchVC.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import <UIKit/UIKit.h>
#import "GFButton.h"
#import "GFTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchVC : UIViewController
@property GFButton      *searchButton;
@property GFTextField   *searchTextField;
@property UIImageView   *logoImageView;

@end

NS_ASSUME_NONNULL_END
