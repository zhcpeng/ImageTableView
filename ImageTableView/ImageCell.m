//
//  ImageCell.m
//  ImageTableView
//
//  Created by SKYA03  on 14-1-16.
//  Copyright (c) 2014年 SKYA03 . All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.contentView.frame = CGRectMake(0, 0, DeviceWidth, DeviceHeight);
        
//        NSLog(@"cell init:%@",NSStringFromCGRect(self.contentView.frame));
        
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0,DeviceWidth - 20, DeviceHeight)];
        [self addSubview:self.imgView];
        
        self.imageName = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, DeviceWidth - 40, 27)];
        _imageName.textAlignment = NSTextAlignmentRight;
        _imageName.backgroundColor = [UIColor clearColor];
        _imageName.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.imageName];
        
        self.page = [[UILabel alloc]initWithFrame:CGRectMake(0, DeviceHeight - 40, DeviceWidth, 27)];
        _page.textAlignment = NSTextAlignmentCenter;
        _page.backgroundColor = [UIColor clearColor];
        [self addSubview:self.page];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
