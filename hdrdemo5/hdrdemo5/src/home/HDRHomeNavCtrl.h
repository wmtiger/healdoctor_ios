//
//  HDRHomeNavCtrl.h
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDRHomeRootCtrl.h"

@protocol HomeNavDelegate <NSObject>

@optional

- (void) showHomeTabbar;

- (void) hideHomeTabbar;

@end

@interface HDRHomeNavCtrl : UINavigationController <HomeRootDelegate>

@property (nonatomic, strong) id<HomeNavDelegate> navDelegate;

@end
