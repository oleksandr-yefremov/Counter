//
// Created by Oleksandr Yefremov on 29.11.15.
// Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CNTDetailModuleInput <NSObject>

/**
 *  Counter id is used to store/retrieve counter value from persistence layer
 */
//@property (nonatomic, assign, readwrite) NSUInteger counterId;
-(void)configureModuleWithData:(NSUInteger)counterId;

@end