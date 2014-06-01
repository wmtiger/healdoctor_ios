//
//  HDRHomeNewsBar.m
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRHomeNewsBar.h"

@implementation HDRHomeNewsBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImageView * bg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"bg_baoguanglan"]];
        [self addSubview:bg];
        
        self.newsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, bg.frame.size.height)];
        self.newsLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.newsLabel];
//        self.newsLabel.text = @"   曝光栏：";
        [self setNewsText:@"某某药有致癌物质"];
    }
    return self;
}

- (void)setNewsText:(NSString *)txt
{
    self.newsLabel.text = [NSString stringWithFormat:@"   曝光栏：%@", txt];
    
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
