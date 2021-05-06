//
//  GFFollowerItemVC.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import "GFItemInfoVC.h"

NS_ASSUME_NONNULL_BEGIN

@protocol GFFollowerItemVCDelegate <NSObject>

- (void)didTapGetFollowersForUser:(User *)user;

@end

@interface GFFollowerItemVC : GFItemInfoVC

@property (nonatomic, weak) id<GFFollowerItemVCDelegate>delegate;

- (instancetype)initWithUser:(User *)user andWithDelegate:(id<GFFollowerItemVCDelegate>)delegate;


@end

NS_ASSUME_NONNULL_END
