//
// Created by Oleksandr Yefremov on 29.11.15.
// Copyright (c) 2015 oleksandr-yefremov.github.io. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol CNTDetailInteractorInput <NSObject>
- (void)requestCount;
- (void)increment;
- (void)decrement;
@end


@protocol CNTDetailInteractorOutput <NSObject>
- (void)updateCount:(NSUInteger)count;
@end
