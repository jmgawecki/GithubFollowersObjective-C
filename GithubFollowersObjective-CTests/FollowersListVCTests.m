//
//  FollowersListVCTests.m
//  GithubFollowersObjective-CTests
//
//  Created by Jakub Gawecki on 01/05/2021.
//

#import <XCTest/XCTest.h>
#import "FollowersListVC.h"

@interface FollowersListVCTests : XCTestCase

@end

@implementation FollowersListVCTests

-(void)testFollowersListVCInstantiatedIsNotNil {
    // Arrange
    FollowersListVC *followerListVC;
    
    // Act
    followerListVC = [[FollowersListVC alloc] initWithUsername:@"Jakub"];
    [followerListVC viewDidLoad];
    
    // Assert
    XCTAssertNotNil(followerListVC);
}
@end
