//
//  FollowersListVC.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import <UIKit/UIKit.h>
#import "Follower.h"
#import "FollowerCell.h"
#import "NetworkManager.h"
#import "UserInfoVC.h"
#import "GFLoadingVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface FollowersListVC : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UserInfoVCDelegate>
@property (nonatomic)UICollectionView   *followersCollectionView;
@property (nonatomic)GFLoadingVC        *progressVC;

@property NetworkManager    *sharedManager;

@property NSMutableArray    *followersArray;
@property NSString          *username;
@property int               page;
@property BOOL              hasMoreFollowers;


// MARK: - Delegates

-(instancetype)initWithUsername:(NSString*)username andWithFollowers:(NSMutableArray*)followers;


@end

NS_ASSUME_NONNULL_END
