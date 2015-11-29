//
// Created by Oleksandr Yefremov on 29.11.15.
// Copyright (c) 2015 oleksandr-yefremov.github.io. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNTDetailView.h"
#import "CNTDetailInteractorIO.h"
#import "CNTDetailModuleInput.h"


@interface CNTDetailPresenter : NSObject <CNTDetailInteractorOutput, CNTDetailModuleInput>
@property (nonatomic, weak)     id<CNTDetailView>            view;
@property (nonatomic, strong)   id<CNTDetailInteractorInput> interactor;

- (void)updateView;
@end
