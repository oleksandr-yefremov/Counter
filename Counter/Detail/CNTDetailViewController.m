//
// Created by Oleksandr Yefremov on 29.11.15.
// Copyright (c) 2015 oleksandr-yefremov.github.io. All rights reserved.
//

#import "CNTDetailViewController.h"
#import "CNTDetailPresenter.h"


@implementation CNTDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.countLabel.text = nil;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.presenter updateView];
}


#pragma mark - Detail view

- (void)setCountText:(NSString*)countText
{
    self.countLabel.text = countText;
}


@end
