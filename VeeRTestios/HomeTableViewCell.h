//
//  HomeTableViewCell.h
//  VeeRTestios
//
//  Created by 张培根 on 2017/8/10.
//  Copyright © 2017年 w.bacon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeDataModel.h"

@interface HomeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *smallImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic,strong) HomeDataModel *cellData;

@end
