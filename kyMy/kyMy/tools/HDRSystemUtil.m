//
//  HDRSystemUtil.m
//  kyMy
//
//  Created by wei sm on 14-5-15.
//  Copyright (c) 2014年 bf. All rights reserved.
//

#import "HDRSystemUtil.h"

@implementation HDRSystemUtil

// 是否是ios7之后的版本
+ (BOOL)isIOS7AndLater
{
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return NO;
    }
    return YES;
}

/**
 * 这里获取ios6或者ios7的状态栏适配
 */
+ (float)getNeedStatusBarHeight
{
    if ([HDRSystemUtil isIOS7AndLater]) {
        // Load resources for iOS 6.1 or earlier
        return 40;
    }
    return 0;
}

@end
