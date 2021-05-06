//
//  GFItemInfoView.h
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 05/05/2021.
//

#import <UIKit/UIKit.h>
#import "GFTitleLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GFItemInfoView : UIView
@property (nonatomic)GFTitleLabel* titleLabel;
@property (nonatomic)GFTitleLabel* countLabel;
@property (nonatomic)UIImageView* symbolImageView;

typedef NS_ENUM(NSUInteger, ItemInfoType) {
    repos,
    gists,
    following,
    followers,
};

-(void)setItemInfoType:(ItemInfoType)itemInfoType withCount:(NSNumber*)count;

@end

NS_ASSUME_NONNULL_END
