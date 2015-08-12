//
//  ForecastTableViewCell.h
//  Anything
//
//  Created by 洪浩 on 15/8/7.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForecastTableViewCell : UITableViewCell<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSArray *weatherData;
@end
