//
//  HDRHomeFunsBar.m
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRHomeFunsBar.h"

@implementation HDRHomeFunsBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImageView * bg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"bg_funsbar"]];
        [self addSubview:bg];
        
        UIButton * hospitalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        hospitalBtn.frame = CGRectMake(0, 0, 80, 82);
        hospitalBtn.backgroundColor = [UIColor clearColor];
//        [hospitalBtn setTitle:@"寻医" forState:UIControlStateNormal];
//        [hospitalBtn setTitle:@"寻医" forState:UIControlStateHighlighted];
        [hospitalBtn addTarget:self action:@selector(clickHospital:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:hospitalBtn];
        
        UIButton * drugBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        drugBtn.frame = CGRectMake(80, 0, 80, 82);
        drugBtn.backgroundColor = [UIColor clearColor];
//        [drugBtn setTitle:@"问药" forState:UIControlStateNormal];
//        [drugBtn setTitle:@"问药" forState:UIControlStateHighlighted];
        [drugBtn addTarget:self action:@selector(clickDrug:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:drugBtn];
        
        UIButton * examBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        examBtn.frame = CGRectMake(160, 0, 80, 82);
        examBtn.backgroundColor = [UIColor clearColor];
//        [examBtn setTitle:@"体检" forState:UIControlStateNormal];
//        [examBtn setTitle:@"体检" forState:UIControlStateHighlighted];
        [examBtn addTarget:self action:@selector(clickExam:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:examBtn];
        
        UIButton * toolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        toolBtn.frame = CGRectMake(240, 0, 80, 82);
        toolBtn.backgroundColor = [UIColor clearColor];
//        [toolBtn setTitle:@"工具" forState:UIControlStateNormal];
//        [toolBtn setTitle:@"工具" forState:UIControlStateHighlighted];
        [toolBtn addTarget:self action:@selector(clickTool:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:toolBtn];
    }
    return self;
}

- (void)clickHospital:(id)sender
{
    [self.delegate showHospital];
}

- (void)clickDrug:(id)sender
{
    [self.delegate showDrug];
}

- (void)clickExam:(id)sender
{
    [self.delegate showExam];
}

- (void)clickTool:(id)sender
{
    [self.delegate showTool];
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
