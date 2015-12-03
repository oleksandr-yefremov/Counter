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

- (instancetype)init {
    if (self = [super init]) {
        self.counterId = 1000;
    }
    return self;
}

- (void)requestCount {
    [self updateCount];
}

- (void)increment {
    ++self.count;
    [self storeCountValue:self.count];
    [self updateCount];
}

- (void)decrement {
    if ([self canDecrement]) {
        --self.count;
        [self storeCountValue:self.count];
        [self updateCount];
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

- (void)updateCount {
    [self.presenter updateCount:self.count];
}


@end
