//
//  GFRepoItemVC.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import "GFItemInfoVC.h"
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@protocol GFRepoItemVCDelegate <NSObject>

- (void)didTapGitHubProfileForUser:(User *)user;

@end

@interface GFRepoItemVC : GFItemInfoVC

@property (nonatomic, weak) id<GFRepoItemVCDelegate>delegate;


-(instancetype)initWithUser:(User *)user andWithDelegate:(id<GFRepoItemVCDelegate>)delegate;




@end

NS_ASSUME_NONNULL_END
