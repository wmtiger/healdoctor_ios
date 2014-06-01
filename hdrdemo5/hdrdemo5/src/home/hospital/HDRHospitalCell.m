//
//  HDRHospitalCell.m
//  hdrdemo5
//
//  Created by wei sm on 14-6-1.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRHospitalCell.h"

@implementation HDRHospitalCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 200, 20)];
        [self addSubview:_titleLabel];
        
        _levelImg = [[UIImageView alloc] initWithFrame:CGRectMake(5, 25, 20,20)];
        [self addSubview:_levelImg];
        
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 25, 180, 20)];
        [self addSubview:_descLabel];
        
        [self setFrame:CGRectMake(0, 0, 320, 64)];
    }
    return self;
}

+ (HDRHospitalCell *) cellWithTabelView:(UITableView *)tableView withData:(NSDictionary *)data
{
    static NSString *ID = @"HospitalCell";
    HDRHospitalCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HDRHospitalCell  alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.titleLabel.text = [data objectForKey:@"name"];
//    cell.descLabel.text = [data objectForKey:@"name"];

    return cell;
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