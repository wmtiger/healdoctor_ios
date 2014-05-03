//
//  HDRManTableViewCell.m
//  hdrdemo3
//
//  Created by wei sm on 14-5-3.
//  Copyright (c) 2014年 bf. All rights reserved.
//

#import "HDRManTableViewCell.h"

@implementation HDRManTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
