//
//  HDRHomeFunsBar.h
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HDRHomeFunsDelegate

@required

- (void)showHospital;

- (void)showDrug;

- (void)showExam;

- (void)showTool;

@end

@interface HDRHomeFunsBar : UIView


@property (nonatomic, strong)id<HDRHomeFunsDelegate> delegate;

@end
