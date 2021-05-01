//
//  FollowersListVC.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import <UIKit/UIKit.h>
#import "Follower.h"
#import "FollowerCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface FollowersListVC : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property NSString *username;
@property UICollectionView *followersCollectionView;
@property NSArray *followersArray;
// MARK: - Delegates

-(instancetype)initWithUsername:(NSString*)username;


@end

NS_ASSUME_NONNULL_END
