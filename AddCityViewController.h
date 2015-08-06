//
//  AddCityViewController.h
//  Anything
//
//  Created by 洪浩 on 15/8/4.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "FileTool.h"
#define kDisplayProvince 0
#define kDisplayCity 1
#define kDisplayArea 2
@interface AddCityViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView* tableView;
@property(nonatomic, assign)int displayType;
@property(nonatomic, strong)NSArray* provinces;
@property(nonatomic, strong)NSArray* citys;
@property(nonatomic, strong)NSArray* areas;
@property(nonatomic, strong)NSString* selectedCity;
@property(nonatomic, strong)NSArray* selectedAreas;
@property(nonatomic, assign)BOOL isSubmit;

//-(void)configureData;
//-(void)configureView;
//-(void)Cancel;
//-(void)Submit;
@end
