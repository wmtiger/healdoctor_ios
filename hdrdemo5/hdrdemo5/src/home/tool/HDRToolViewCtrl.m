//
//  HDRToolViewCtrl.m
//  hdrdemo5
//
//  Created by wei sm on 14-5-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRToolViewCtrl.h"

@interface HDRToolViewCtrl ()

@end

@implementation HDRToolViewCtrl

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
    
    UIView * subv = (UIView *)[[self.navigationController.navigationBar subviews] objectAtIndex:0];
    [subv removeFromSuperview];
    UIImageView * bg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"bg_navbar"]];
    bg.frame = CGRectMake(0, 0, 320, 44);
    [self.navigationController.navigationBar addSubview:bg];
    

    UIImageView * btnbg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"bg_backbtn"]];
    btnbg.frame = CGRectMake(10, 0, 53, 44);
    [self.navigationController.navigationBar addSubview:btnbg];
    
    UIButton * backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 53, 44)];
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButtonItem;
    

}

- (void) clickBackBtn:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
