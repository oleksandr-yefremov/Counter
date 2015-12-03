//
// Created by Oleksandr Yefremov on 29.11.15.
// Copyright (c) 2015 oleksandr-yefremov.github.io. All rights reserved.
//

#import "CNTRouter.h"

#import "CNTDetailViewController.h"
#import "CNTDetailPresenter.h"
#import "CNTDetailInteractor.h"
#import "CNTDetailModuleInput.h"


@interface CNTRouter ()

@property (nonatomic, strong, readwrite) UINavigationController *navigationController;

@end

@implementation CNTRouter

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    if (self = [super init]) {
        self.navigationController = navigationController;
    }
    return self;
}

- (void)transitionToDetailScreenWithData:(NSUInteger)counterId {

    // Assemble module
    CNTDetailViewController* view = [[CNTDetailViewController alloc] init];
    CNTDetailPresenter* presenter = [[CNTDetailPresenter alloc] init];
    CNTDetailInteractor* interactor = [[CNTDetailInteractor alloc] init];

    view.presenter = presenter;
    presenter.view = view;

    presenter.interactor = interactor;
    interactor.presenter = presenter;

    // Set module's input data
    id<CNTDetailModuleInput> moduleInput = ((id<CNTDetailModuleInput>) presenter);
//    moduleInput.counterId = counterId;
    // or alternatively we could use methods or blocks here
    [moduleInput configureModuleWithData:counterId];

    // Navigate to it
    [self.navigationController pushViewController:view animated:true];
}


@end