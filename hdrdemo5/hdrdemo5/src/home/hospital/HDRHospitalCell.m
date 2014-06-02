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
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 200, 30)];
        [self addSubview:_titleLabel];
        
        _levelImg = [[UIImageView alloc] initWithFrame:CGRectMake(5, 35, 20, 20)];
        [self addSubview:_levelImg];
        
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 35, 100, 20)];
        [self addSubview:_descLabel];
        
        _goodImg = [[UIImageView alloc] initWithFrame:CGRectMake(140, 35, 20, 20)];
        _goodImg.image = [UIImage imageNamed:@"icon_good"];
        [self addSubview:_goodImg];
        
        _positionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_positionBtn setFrame:CGRectMake(240, 16, 30, 30)];
        [_positionBtn setImage:[UIImage imageNamed:@"btn_local"] forState:UIControlStateNormal];
        [_positionBtn addTarget:self action:@selector(clickPosition:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_positionBtn];
        
        _navToBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_navToBtn setFrame:CGRectMake(280, 16, 30, 30)];
        [_navToBtn setImage:[UIImage imageNamed:@"btn_navto"] forState:UIControlStateNormal];
        [_navToBtn addTarget:self action:@selector(clickNavTo:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_navToBtn];
        
    }
    return self;
}

- (void)clickPosition:(id)sender
{
    
}

- (void)clickNavTo:(id)sender
{
    
}

+ (HDRHospitalCell *) cellWithTabelView:(UITableView *)tableView withData:(NSDictionary *)data
{
    static NSString *ID = @"HospitalCell";
    HDRHospitalCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HDRHospitalCell  alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.data = data;
    cell.titleLabel.text = [data objectForKey:@"name"];
    cell.descLabel.text = [data objectForKey:@"feature"];
    if ([[data objectForKey:@"level2"] isEqualToString:@"1"]) {
        cell.levelImg.image = [UIImage imageNamed:@"icon_level"];
    }
    else
    {
        cell.levelImg.image = nil;
    }

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