//
//  CNTCountPresenter.h
//  Counter
//
//  Created by Jeff Gilbert on 8/23/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNTCountInteractorIO.h"

@class CNTRouter;
@protocol CNTCountView;

@interface CNTCountPresenter : NSObject <CNTCountInteractorOutput>

@property (nonatomic, weak) id <CNTCountView> view;
@property (nonatomic, strong) id <CNTCountInteractorInput> interactor;
@property (nonatomic, strong) CNTRouter *router;

- (void)updateView;

- (void)didTapIncrement;

- (void)didTapDecrement;

- (void)didTapShowDetail;

@end
