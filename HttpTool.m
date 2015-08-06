//
//  HttpTool.m
//  Anything
//
//  Created by 洪浩 on 15/7/28.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import "HttpTool.h"
#import "Weather.h"

@implementation HttpTool

+ (HttpTool *)sharedHttpTool{
    static HttpTool *httpTool = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        httpTool = [[HttpTool alloc]init];
    });
    return httpTool;
}

-(void)weatherRequestWithCityInfo:(NSString *)cityInfo
                          success:(void(^)(id)) success
                          failure:(void(^)(id)) failure{
    NSString *urlString = [NSString stringWithFormat:@"http://api.map.baidu.com/telematics/v3/weather?location=%@&output=json&mcode=com.ccs.Weather&ak=%@",cityInfo,kBaiduKey];
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request =
    [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init]completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    NSDictionary *resp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    Weather *weather = [[Weather alloc]initWithDictionary:resp error:nil];
    if (weather) {
        success(weather);
    }
    }];
}

@end
