//
//  HomeDataModel.h
//  VeeRTestios
//
//  Created by 张培根 on 2017/8/10.
//  Copyright © 2017年 w.bacon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeDataModel : NSObject

@property (nonatomic ,copy) NSString *titleString;
@property (nonatomic ,copy) NSString *imageUrl;

+(HomeDataModel *)dataModelWithDict:(NSDictionary *)dataDict;

@end
