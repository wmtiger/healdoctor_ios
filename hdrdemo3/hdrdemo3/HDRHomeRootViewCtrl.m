//
//  HDRHomeRootViewCtrl.m
//  hdrdemo3
//
//  Created by wei sm on 14-5-3.
//  Copyright (c) 2014年 bf. All rights reserved.
//

#import "HDRHomeRootViewCtrl.h"
#import "IAdObj.h"
#import "IAdView.h"

@interface HDRHomeRootViewCtrl ()

@end

@implementation HDRHomeRootViewCtrl

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor redColor];
    [self initIAd];
    
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
        IAdView * adv = [[IAdView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        [viewList addObject:adv];
        [adv setIAdObj: iadList[i]];
    };
    
    self.cycleScrollView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 20, 320, 200) animationDuration:2];
    self.cycleScrollView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        return viewList[pageIndex];
    };
    self.cycleScrollView.totalPagesCount = ^NSInteger(void){
        return [viewList count];
    };
    self.cycleScrollView.TapActionBlock = ^(NSInteger pageIndex){
        NSLog(@"click %d", pageIndex);
    };
    [self.view addSubview:self.cycleScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *加以下俩方法可以实现nav的root不显示navbar，其他的view显示navbar
 */
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    
    [self.cycleScrollView resumeScroll];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    
    [self.cycleScrollView pauseScroll];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
