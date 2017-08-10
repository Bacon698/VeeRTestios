//
//  HomeDataModel.m
//  VeeRTestios
//
//  Created by 张培根 on 2017/8/10.
//  Copyright © 2017年 w.bacon. All rights reserved.
//

#import "HomeDataModel.h"

@implementation HomeDataModel

+(HomeDataModel *)dataModelWithDict:(NSDictionary *)dataDict{
    
    HomeDataModel *model = [[HomeDataModel alloc]init];
    
    model.imageUrl = dataDict[@"imgsrc"];
    model.titleString = dataDict[@"title"];
    
    return model;
    
}

@end
