//
//  Counter - CACountInteractorTests.m
//  Copyright 2013 Mutual Mobile. All rights reserved.
//
//  Created by: Jeff Gilbert
//

// Class under test
#import "CNTCountInteractor.h"

// Test support
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import "OCHamcrest.h"


#define assertCountEquals(expected) assertThatUnsignedInteger(self.count, equalToUnsignedInteger(expected))


@interface CNTCountInteractorTests : XCTestCase <CNTCountInteractorOutput>
@property (nonatomic, strong)   id<CNTCountInteractorInput> interactor;
@property (nonatomic, assign)   NSUInteger                  count;
@end


@implementation CNTCountInteractorTests

- (void)setUp
{
    [super setUp];
    
    CNTCountInteractor* interactor = [[CNTCountInteractor alloc] init];
    interactor.presenter = self;
    self.interactor      = interactor;
}


- (void)testInitialCountIsZero
{
    self.count = 1;
    
    [self.interactor requestCount];
    
    assertCountEquals(0);
}


- (void)testOneIncrementReturnsOne
{
    [self.interactor increment];
    
    assertCountEquals(1);
}


- (void)testTwoIncrementsReturnsTwo
{
    [self.interactor increment];
    [self.interactor increment];
    
    assertCountEquals(2);
}


- (void)testDecrementFromZeroReturnsZero
{
	[self.interactor decrement];
    
	assertCountEquals(0);
}


- (void)testOneDecrementFromOneReturnsZero
{
	[self.interactor increment];
    
	[self.interactor decrement];
    
	assertCountEquals(0);
}


- (void)testOneDecrementFromTwoReturnsOne
{
	[self.interactor increment];
    [self.interactor increment];
    
	[self.interactor decrement];
    
	assertCountEquals(1);
}


#pragma mark - Interactor Output

- (void)updateCount:(NSUInteger)count
{
    self.count = count;
}

@end
