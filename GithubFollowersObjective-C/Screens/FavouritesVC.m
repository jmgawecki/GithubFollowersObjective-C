//
//  FavouritesVC.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import "FavouritesVC.h"
#import "FavouritesCell.h"

@interface FavouritesVC ()

@end

@implementation FavouritesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureVC];
    [self instantiateUIElements];
    [self layoutAndConfigureUI];
}


// MARK: - VC Configuration

- (void)configureVC {
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}


// MARK: - UI Elements Configuration


- (void)instantiateUIElements {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
}


- (void)layoutAndConfigureUI {
    [self.view addSubview:self.tableView];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.backgroundColor  = [UIColor systemBackgroundColor];
    self.tableView.rowHeight        = 80;
    
    [self.tableView registerNib:FavouritesCell.self forCellReuseIdentifier:FavouritesCell.reuseID];
}

@end
