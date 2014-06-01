//
//  HDRDrugStoreCell.m
//  hdrdemo5
//
//  Created by wei sm on 14-6-1.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRDrugStoreCell.h"

@implementation HDRDrugStoreCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 160, 20)];
        [self addSubview:_titleLabel];
        
        _yibaoImg = [[UIImageView alloc] initWithFrame:CGRectMake(5, 25, 20,20)];
        [self addSubview:_yibaoImg];
        
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 25, 160, 20)];
        [self addSubview:_descLabel];
        
        [self setFrame:CGRectMake(0, 0, 320, 64)];
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

+ (HDRDrugStoreCell *) cellWithTabelView:(UITableView *)tableView withData:(NSDictionary *)data
{
    static NSString *ID = @"DrugStroeCell";
    HDRDrugStoreCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HDRDrugStoreCell  alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.titleLabel.text = [data objectForKey:@"name"];
    return cell;
}

@end
