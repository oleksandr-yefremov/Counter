//
// Created by Oleksandr Yefremov on 29.11.15.
// Copyright (c) 2015 oleksandr-yefremov.github.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNTDetailView.h"

@class CNTDetailPresenter;


@interface CNTDetailViewController : UIViewController <CNTDetailView>
@property (nonatomic, weak) IBOutlet    UILabel*    countLabel;

@property (nonatomic, strong)   CNTDetailPresenter*  presenter;
@end
