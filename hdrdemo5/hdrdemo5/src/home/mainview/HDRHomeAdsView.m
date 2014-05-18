//
//  HDRHomeAdsView.m
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRHomeAdsView.h"
#import "CycleScrollView.h"
#import "IAdObj.h"
#import "IAdView.h"

@implementation HDRHomeAdsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self initIAd];
        
    }
    return self;
}

- (void)initIAd
{
    NSMutableArray * viewList = [@[] mutableCopy];
    NSMutableArray * iadList = [@[] mutableCopy];
    
    // test
    IAdObj *obj = [[IAdObj alloc]init];
    obj.url = @"http://ww1.sinaimg.cn/large/53e0c4edjw1dy3qf6n17xj.jpg";
    obj.title = @"test1";
    [iadList addObject:obj];
    
    obj = [[IAdObj alloc]init];
    obj.url = @"http://www.ynwssn.com/file/upload/201106/30/15-54-54-98-45.jpg.middle.jpg";
    obj.title = @"test2";
    [iadList addObject:obj];
    
    obj = [[IAdObj alloc]init];
    obj.url = @"http://fs0.139js.com/file/s_jpg_6c26a24fjw1dmaubfgms1j.jpg";
    obj.title = @"test3";
    [iadList addObject:obj];
    
    NSLog(@"iadlist%d", [iadList count]);
    for (int i = 0; i < [iadList count]; i++) {
        IAdView * adv = [[IAdView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
        [viewList addObject:adv];
        [adv setIAdObj: iadList[i]];
    };
    
    self.cycleScrollView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 150) animationDuration:2];
    self.cycleScrollView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        return viewList[pageIndex];
    };
    self.cycleScrollView.totalPagesCount = ^NSInteger(void){
        return [viewList count];
    };
    self.cycleScrollView.TapActionBlock = ^(NSInteger pageIndex){
        NSLog(@"click %d", pageIndex);
    };
    [self addSubview:self.cycleScrollView];
}

- (void)resumeScroll
{
    [self.cycleScrollView resumeScroll];
}

- (void)pauseScroll
{
    [self.cycleScrollView pauseScroll];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
