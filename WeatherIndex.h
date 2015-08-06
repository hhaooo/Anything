//
//  WeatherIndex.h
//  Anything
//
//  Created by 洪浩 on 15/7/28.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import "JSONModel.h"

@protocol WeatherIndex
@end
@interface WeatherIndex : JSONModel

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *zs;
@property(nonatomic,copy)NSString *tipt;
@property(nonatomic,copy)NSString *des;
@end
