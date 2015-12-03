//
//  Counter - CACountPresenterTests.m
//  Copyright 2013 Mutual Mobile. All rights reserved.
//
//  Created by: Jeff Gilbert
//

// Class under test
#import "CNTCountPresenter.h"

// Collaborators
#import "CNTCountView.h"
#import "CNTCountInteractorIO.h"

// Test support
#import <XCTest/XCTest.h>

#define MOCKITO_SHORTHAND
#import "OCMockito.h"


@interface CNTCountPresenterTests : XCTestCase
@property (nonatomic, strong)   CNTCountPresenter*          presenter;
@property (nonatomic, strong)   id<CNTCountView>            view;
@property (nonatomic, strong)   id<CNTCountInteractorInput> interactor;
@end


@implementation CNTCountPresenterTests

- (void)setUp
{
    [super setUp];
    
    self.presenter = [[CNTCountPresenter alloc] init];
    
    self.view = mockProtocol(@protocol(CNTCountView));
    self.presenter.view = self.view;
    
    self.interactor = mockProtocol(@protocol(CNTCountInteractorInput));
    self.presenter.interactor = self.interactor;
}


- (void)testUpdateViewRequestsInteractorCount
{
    [self.presenter updateView];
    
    [verify(self.interactor) requestCount];
}


- (void)testIncrementRequestsInteractorIncrement
{
    [self.presenter didTapIncrement];

    [verify(self.interactor) didTapIncrement];
}


- (void)testDecrementRequestsInteractorDecrement
{
    [self.presenter didTapDecrement];

    [verify(self.interactor) didTapDecrement];
}


- (void)testReceivingZeroDisplaysZero
{
    [self.presenter updateCount:0];
    
    [verify(self.view) setCountText:@"zero"];
}


- (void)testReceivingOneDisplaysOne
{
    [self.presenter updateCount:1];
    
    [verify(self.view) setCountText:@"one"];
}


- (void)testReceivingZeroDisablesDecrement
{
    [self.presenter updateCount:0];
    
    [verify(self.view) setDecrementEnabled:NO];
}


- (void)testReceivingOneEnablesDecrement
{
    [self.presenter updateCount:1];
    
    [verify(self.view) setDecrementEnabled:YES];
}

@end
