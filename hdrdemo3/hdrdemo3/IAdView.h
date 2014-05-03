//
//  IAdView.h
//  hdrdemo3
//
//  Created by wei sm on 14-5-3.
//  Copyright (c) 2014年 bf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAdObj.h"

@interface IAdView : UIView

@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UILabel * title;

- (void)setIAdObj:(IAdObj *)obj;

@end
