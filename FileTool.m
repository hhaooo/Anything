//
//  FileTool.m
//  Anything
//
//  Created by 洪浩 on 15/8/4.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import "FileTool.h"

@implementation FileTool

+(void)writeWeatherToFile:(Weather *)weather withCity:(NSString *)city{
    
    if (!city) {
        city = @"default";
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    NSString *rootPath = [paths objectAtIndex:0];//获取根目录
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:weather];
    NSString *filePath = [rootPath stringByAppendingPathComponent:city];
    [data writeToFile:filePath atomically:TRUE];
}

+(Weather *)readWeatherFromFileWithCity:(NSString *)city{
    
    if (!city) {
        city = @"default";
    }
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE);
    NSString* rootPath = [paths objectAtIndex:0];//获取根目录
    NSString* filePath = [rootPath stringByAppendingString:city];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    Weather* weather = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return  weather;
}

+(void)writeCitysToFile:(NSMutableArray *)citys{
    
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE);
    NSString* rootPath = [paths objectAtIndex:0];
    NSString* filePath = [rootPath stringByAppendingString:@"cityList"];//获取根目录
    [citys writeToFile:filePath atomically:TRUE  ];
}

+(NSMutableArray*)readCitysFromFile{
    
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE);
    NSString* rootPath = [paths objectAtIndex:0];
    NSString* filePath = [rootPath stringByAppendingString:@"cityList"];
    NSMutableArray* citys = [NSMutableArray arrayWithContentsOfFile: filePath];
    if (!citys) {
        citys = [NSMutableArray array];
    }
    return citys;
}


@end
