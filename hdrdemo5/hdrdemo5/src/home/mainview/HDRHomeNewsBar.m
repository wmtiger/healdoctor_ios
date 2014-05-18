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
        
        self.newsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        self.newsLabel.backgroundColor = [UIColor redColor];
        [self addSubview:self.newsLabel];
        self.newsLabel.text = @"  这里是新闻";
        
    }
    return self;
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
