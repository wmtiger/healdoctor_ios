//
//  HDRDrugCell.m
//  hdrdemo5
//
//  Created by wei sm on 14-6-2.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRDrugCell.h"

@implementation HDRDrugCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (HDRDrugCell *) cellWithTabelView:(UITableView *)tableView withData:(NSDictionary *)data
{
    static NSString *ID = @"DrugCell";
    HDRDrugCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HDRDrugCell  alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.textLabel.text = [data objectForKey:@"name"];
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
