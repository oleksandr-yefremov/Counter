//
//  CACountInteractor.m
//  Counter
//
//  Created by Jeff Gilbert on 8/22/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import "CNTCountInteractor.h"


NSString *kCNTCounterStoreKey = @"kCNTCounterStoreKey";

@interface CNTCountInteractor ()
@property (nonatomic, assign, readwrite) NSUInteger count;
@property (nonatomic, assign, readwrite) NSUInteger counterId;
@end

@implementation CNTCountInteractor

- (void)requestCount {
    [self sendCount];
}

- (void)increment {
    ++self.count;
    [self storeCountValue:self.count];
    [self sendCount];
}

- (void)decrement {
    if ([self canDecrement]) {
        --self.count;
        [self storeCountValue:self.count];
        [self sendCount];
    }
}

- (BOOL)canDecrement {
    return (self.count > 0);
}

- (void)storeCountValue:(NSUInteger)count {
    // DataManager will be called here in case of more complex data persistence
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:count forKey:[@(self.counterId) stringValue]];
}

- (void)sendCount {
    [self.output updateCount:self.count];
}


@end
