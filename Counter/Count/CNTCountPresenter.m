//
//  CACountPresenter.m
//  Counter
//
//  Created by Jeff Gilbert on 8/23/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import "CNTCountPresenter.h"
#import "CNTCountView.h"
#import "CNTRouter.h"


@interface CNTCountPresenter ()
@property (nonatomic, strong) NSNumberFormatter *countFormatter;
@end


@implementation CNTCountPresenter

- (void)updateView {
    [self.interactor requestCount];
}

- (void)increment {
    [self.interactor increment];
}

- (void)decrement {
    [self.interactor decrement];
}

- (void)showDetailScreen {
    NSUInteger counterId = self.interactor.counterId;
    [self.router transitionToDetailScreenWithData:counterId];
}

- (NSNumberFormatter *)countFormatter {
    if (_countFormatter == nil) {
        _countFormatter = [[NSNumberFormatter alloc] init];
        [_countFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    }

    return _countFormatter;
}

#pragma mark - Interactor output

- (void)updateCount:(NSUInteger)count {
    [self.view setCountText:[self formattedCount:count]];
    [self.view setDecrementEnabled:[self canDecrementCount:count]];
}

- (NSString *)formattedCount:(NSUInteger)count {
    return [self.countFormatter stringFromNumber:@(count)];
}

- (BOOL)canDecrementCount:(NSUInteger)count {
    return (count > 0);
}

@end
