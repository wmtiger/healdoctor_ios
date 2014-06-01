//
//  HDRHomeNavCtrl.m
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRHomeNavCtrl.h"
#import "HDRHomeRootCtrl.h"

@interface HDRHomeNavCtrl ()

@end

@implementation HDRHomeNavCtrl

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
    
    HDRHomeRootCtrl * rootvc = [[HDRHomeRootCtrl alloc] init];
    rootvc.delegate = self;
    
    NSArray * ctrls = [[NSArray alloc] initWithObjects:rootvc, nil];
    
    self.viewControllers = ctrls;
    
    self.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HomeRootDelegate

- (void) showHomeTabbar
{
    [_navDelegate showHomeTabbar];
//    NSLog(@"showHomeTabbar");
}

- (void) hideHomeTabbar
{
    [_navDelegate hideHomeTabbar];
//    NSLog(@"hideHomeTabbar");
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
