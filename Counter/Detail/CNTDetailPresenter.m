//
// Created by Oleksandr Yefremov on 29.11.15.
// Copyright (c) 2015 oleksandr-yefremov.github.io. All rights reserved.
//

#import "CNTDetailPresenter.h"


@interface DetailStateStorage : NSObject
@property (nonatomic, assign, readwrite) NSUInteger counterId;
@end

@implementation DetailStateStorage
@synthesize counterId = _counterId;
@end


@interface CNTDetailPresenter()
@property (nonatomic, strong, readwrite) DetailStateStorage *presenterStateStorage;
@end

@implementation CNTDetailPresenter

//@synthesize count = _count;

#pragma mark - CNTDetailModuleInput
- (void)configureModuleWithData:(NSUInteger)counterId {
    self.presenterStateStorage = [DetailStateStorage new];
    self.presenterStateStorage.counterId = counterId;
    [self.interactor requestDetails:counterId];
}

- (void)updateView
{
    [self.interactor requestDetails:self.presenterStateStorage.counterId];
}

#pragma mark - Interactor output

- (void)updateDetails:(NSUInteger)count
{
    [self.view setCountText:[NSString stringWithFormat:@"%d", count]];
}

@end
