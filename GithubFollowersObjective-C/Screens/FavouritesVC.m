//
//  FavouritesVC.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import "FavouritesVC.h"

@interface FavouritesVC ()

@end

@implementation FavouritesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureVC];
}

- (void)configureVC {
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}


@end
