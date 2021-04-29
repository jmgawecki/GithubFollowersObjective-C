//
//  SearchVC.m
//  GithubFollowersObjective-CTests
//
//  Created by Jakub Gawecki on 29/04/2021.
//

#import <XCTest/XCTest.h>

@interface SearchVC : XCTestCase

@property (strong, nonatomic) SearchVC *searchVC;

@end

@implementation SearchVC

- (void)testInstantiatedSearchVCIsNotNil {
    // Arrange Act
    self.searchVC = [[SearchVC alloc] init];
    
    // Assert
    XCTAssertNotNil(self.searchVC);
}

@end
