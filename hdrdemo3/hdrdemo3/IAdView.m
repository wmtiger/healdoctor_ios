//
//  IAdView.m
//  hdrdemo3
//
//  Created by wei sm on 14-5-3.
//  Copyright (c) 2014年 bf. All rights reserved.
//

#import "IAdView.h"
#import "IAdObj.h"

@implementation IAdView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initAdView];
    }
    return self;
}

- (void)initAdView
{
    NSLog(@"initadview");
//    NSString * picsURL = @"http://ww1.sinaimg.cn/large/53e0c4edjw1dy3qf6n17xj.jpg";
    NSString * picsURL = @"testiad.png";
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
//    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:picsURL]]];
    UIImage *image = [UIImage imageNamed:picsURL];
    [self.imageView setImage:image];
    [self addSubview:self.imageView];
    
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, 320, 30)];
    self.title.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [self addSubview:self.title];
}

- (void)setIAdObj:(IAdObj *)obj
{
    NSString * picsURL = obj.url;
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:picsURL]]];
    [self.imageView setImage:image];
    
    NSString * labelHead = @"  ";
    self.title.text = [labelHead stringByAppendingString:obj.title];
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
