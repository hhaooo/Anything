//
//  Weather.h
//  Anything
//
//  Created by 洪浩 on 15/7/28.
//  Copyright © 2015年 洪浩. All rights reserved.
//
#import "JSONModel.h"
#import "Results.h"

@interface Weather : JSONModel

@property(nonatomic,assign)int error;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *date;
@property(nonatomic, strong) NSArray<Results*>*results;

@end
