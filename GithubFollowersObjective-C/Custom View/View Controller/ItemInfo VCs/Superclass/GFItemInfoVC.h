//
//  GFItemInfoVC.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import <UIKit/UIKit.h>
#import "GFButton.h"
#import "GFItemInfoView.h"
#import "User.h"
#import "Follower.h"

NS_ASSUME_NONNULL_BEGIN

@interface GFItemInfoVC : UIViewController
@property (nonatomic)UIStackView*       stackView;
@property (nonatomic)GFItemInfoView*    itemInfoViewOne;
@property (nonatomic)GFItemInfoView*    itemInfoViewTwo;
@property (nonatomic)GFButton*          actionButton;

@property User* user;
@property Follower* follower;


-(instancetype)initWithUser:(User*)user andWithFollower:(Follower*)follower;

-(void)actionButtonTapped;

@end

NS_ASSUME_NONNULL_END
