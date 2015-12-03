//
// Created by Oleksandr Yefremov on 29.11.15.
// Copyright (c) 2015 oleksandr-yefremov.github.io. All rights reserved.
//

#import "CNTDetailInteractor.h"
#import "CNTCountInteractorIO.h"


@interface CNTDetailInteractor()
@property (nonatomic, assign)   NSUInteger  count;
@end


@implementation CNTDetailInteractor

- (void)requestDetails:(NSUInteger)counterId
{
    // Retrieve counter value from Data Manager
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSUInteger counterValue = (NSUInteger) [defaults integerForKey:[@(counterId) stringValue]];
    self.count = counterValue;

    // Update presenter
    [self.presenter updateDetails:self.count];
}

@end
