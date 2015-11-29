//
// Created by Oleksandr Yefremov on 29.11.15.
// Copyright (c) 2015 oleksandr-yefremov.github.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CNTDetailModuleInput;

@interface CNTRouter : NSObject

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

- (void)transitionToDetailScreenWithData:(NSUInteger)counterId;

@end