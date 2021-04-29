//
//  SearchVC.m
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import "SearchVC.h"

@interface SearchVC ()

@end

@implementation SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureVC];
    // Do any additional setup after loading the view.
}

-(void)configureVC {
    self.view.backgroundColor = [UIColor systemRedColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
