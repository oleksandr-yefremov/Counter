//
//  CNTCountViewController.m
//  Counter
//
//  Created by Jeff Gilbert on 8/23/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import "CNTCountViewController.h"
#import "CNTCountPresenter.h"


@implementation CNTCountViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.countLabel.text = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.presenter updateView];
}

#pragma mark - Count view

- (void)setCountText:(NSString *)countText {
    self.countLabel.text = countText;
}

- (void)setDecrementEnabled:(BOOL)enabled {
    self.decrementButton.enabled = enabled;
}

#pragma mark - Actions

- (IBAction)didTapIncrement:(id)sender {
    [self.presenter increment];
}

- (IBAction)didTapDecrement:(id)sender {
    [self.presenter decrement];
}

- (IBAction)didTapShowDetail:(id)sender {
    [self.presenter showDetailScreen];
}

@end
