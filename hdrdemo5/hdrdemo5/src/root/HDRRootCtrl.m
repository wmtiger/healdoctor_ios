//
//  HDRRootCtrl.m
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRRootCtrl.h"
#import "HDRHomeNavCtrl.h"
#import "HDRHomeRootCtrl.h"
#import "HDRNearCtrl.h"
#import "HDRUserCtrl.h"
#import "HDRMoreCtrl.h"

@interface HDRRootCtrl ()

@end

@implementation HDRRootCtrl

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
//    HDRHomeNavCtrl * homevc = [[HDRHomeNavCtrl alloc] initWithRootViewController:[[HDRHomeRootCtrl alloc] init]];
    
    HDRHomeNavCtrl * homevc = [[HDRHomeNavCtrl alloc] init];
    
    HDRNearCtrl * nearvc = [[HDRNearCtrl alloc] init];
    
    HDRUserCtrl * uservc = [[HDRUserCtrl alloc] init];
    
    HDRMoreCtrl * morevc = [[HDRMoreCtrl alloc] init];
    
    homevc.title = @"首页";
    nearvc.title = @"附近";
    uservc.title = @"用户";
    morevc.title = @"更多";
    
    NSArray * ctrls = [[NSArray alloc] initWithObjects:homevc, nearvc, uservc, morevc, nil];
    self.viewControllers = ctrls;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
