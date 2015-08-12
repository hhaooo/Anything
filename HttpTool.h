//
//  HttpTool.h
//  Anything
//
//  Created by 洪浩 on 15/7/28.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kHttpTool [HttpTool sharedHttpTool]
static NSString *const kBaiduKey = @"NzqQGxUQcFnBiMX71cyQEtXi";

@interface HttpTool : NSObject

+ (HttpTool *) sharedHttpTool;

-(void)weatherRequestWithCityInfo:(NSString *)cityInfo
                          success:(void(^)(id)) success
                          failure:(void(^)(id)) failure;


@end
