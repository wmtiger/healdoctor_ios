//
//  HDRPedometerViewController.m
//  计步器
//  hdrdemo3
//
//  Created by wei sm on 14-5-4.
//  Copyright (c) 2014年 bf. All rights reserved.
//

#import "HDRPedometerViewController.h"

@interface HDRPedometerViewController ()

@end

@implementation HDRPedometerViewController

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
    
}

- (void)initResetBtn
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(20, 20, 280, 30);
    [btn setTitle:@"重置" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClickReset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClickReset
{
    NSLog(@"click reset");
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
