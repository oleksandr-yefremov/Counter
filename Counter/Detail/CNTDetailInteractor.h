//
// Created by Oleksandr Yefremov on 29.11.15.
// Copyright (c) 2015 oleksandr-yefremov.github.io. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNTDetailInteractorIO.h"


@interface CNTDetailInteractor : NSObject <CNTDetailInteractorInput>
@property (nonatomic, weak) id<CNTDetailInteractorOutput> presenter;
@end
