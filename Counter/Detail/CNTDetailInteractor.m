//
// Created by Oleksandr Yefremov on 29.11.15.
// Copyright (c) 2015 oleksandr-yefremov.github.io. All rights reserved.
//

#import "CNTDetailInteractor.h"


@interface CNTDetailInteractor()
@property (nonatomic, assign)   NSUInteger  count;
@end


@implementation CNTDetailInteractor

- (void)requestCount
{
    [self sendCount];
}


- (void)increment
{
    ++self.count;
    [self sendCount];
}


- (void)decrement
{
	if ([self canDecrement])
	{
        --self.count;
        [self sendCount];
    }
}


- (BOOL)canDecrement
{
	return (self.count > 0);
}


- (void)sendCount
{
    [self.output updateCount:self.count];
}

@end
