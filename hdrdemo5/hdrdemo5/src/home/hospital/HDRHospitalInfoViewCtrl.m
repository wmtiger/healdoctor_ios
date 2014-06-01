//
//  HDRHospitalInfoViewCtrl.m
//  hdrdemo5
//
//  Created by wei sm on 14-6-1.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRHospitalInfoViewCtrl.h"

@interface HDRHospitalInfoViewCtrl ()

@end

@implementation HDRHospitalInfoViewCtrl

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
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setInfoData:(id)data
{
    
    UIImageView * imgDrug = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"img_drug"]];
    imgDrug.frame = CGRectMake(10, 10, 101, 80);
    [self.view addSubview:imgDrug];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(120, 10, 140, 20)];
    label.text = data;
    [self.view addSubview:label];
    
    UIImageView * goodbg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"bg_togood"]];
    goodbg.frame = CGRectMake(0, 460 - 49 - 44 - 49, 320, 49);
    [self.view addSubview:goodbg];
    
    UIButton * goodBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [goodBtn setFrame:CGRectMake(320-126-10, goodbg.frame.origin.y, 126, 49)];
    [goodBtn setImage:[UIImage imageNamed:@"btn_good"] forState:UIControlStateNormal];
    [self.view addSubview:goodBtn];
}

//- (void) viewWillAppear:(BOOL)animated
//{
//    [self.tabBarController.tabBar setHidden:YES];
//    [super viewWillAppear:animated];
//}
//
//-(void) viewWillDisappear:(BOOL)animated
//{
//    [self.tabBarController.tabBar setHidden:NO];
//    [super viewWillDisappear:animated];
//}

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
