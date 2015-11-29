//
//  CACountInteractor.m
//  Counter
//
//  Created by Jeff Gilbert on 8/22/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import "CNTCountInteractor.h"


NSString *kCNTCounterStoreKey = @"kCNTCounterStoreKey";

@interface CNTCountInteractor()
@property (nonatomic, assign, readwrite)   NSUInteger  count;
@property (nonatomic, assign, readwrite)   NSUInteger  counterId;
@end

@implementation CNTCountInteractor

- (void)requestCount
{
    [self updateAndSendCount];
}


- (void)increment
{
    ++self.count;
    [self updateAndSendCount];
}


- (void)decrement
{
	if ([self canDecrement])
	{
        --self.count;
        [self updateAndSendCount];
    }
}


- (BOOL)canDecrement
{
	return (self.count > 0);
}


- (void)updateAndSendCount
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.count forKey:[@(self.counterId) stringValue]];

    [self.output updateCount:self.count];
}

@end
