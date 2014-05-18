//
//  HDRHomeAdsView.h
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CycleScrollView.h"

@interface HDRHomeAdsView : UIView

@property (nonatomic, strong) CycleScrollView * cycleScrollView;

- (void)resumeScroll;

- (void)pauseScroll;

@end
