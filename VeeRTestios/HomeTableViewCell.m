//
//  HomeTableViewCell.m
//  VeeRTestios
//
//  Created by 张培根 on 2017/8/10.
//  Copyright © 2017年 w.bacon. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface HomeTableViewCell ()



@end

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.smallImageView.contentMode =  UIViewContentModeCenter;
//    self.smallImageView.clipsToBounds  = YES;
//    self.smallImageView.frame = CGRectMake(0, 0, 135, 101);
    // Initialization code
}

//-(void)setCellData:(HomeDataModel *)cellData{
//    _cellData = cellData;
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:cellData.imageUrl]completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        
//    }];
//    self.titleLabel.text = cellData.titleString;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
