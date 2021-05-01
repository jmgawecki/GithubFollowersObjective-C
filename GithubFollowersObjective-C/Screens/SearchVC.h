//
//  SearchVC.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import <UIKit/UIKit.h>
#import "GFButton.h"
#import "GFTextField.h"
#import "FollowersListVC.h"
#import "NetworkManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchVC : UIViewController <UITextFieldDelegate>
@property GFButton      *searchButton;
@property GFTextField   *searchTextField;
@property UIImageView   *logoImageView;
@property NetworkManager *sharedManager;
@property NSMutableArray *followersArray;

@end

NS_ASSUME_NONNULL_END
