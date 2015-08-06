//
//  HeaderTableViewCell.h
//  Anything
//
//  Created by 洪浩 on 15/7/28.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"

@interface HeaderTableViewCell : UITableViewCell

@property (weak, nonatomic) Weather* weather;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pm25ImageView;
@property (weak, nonatomic) IBOutlet UILabel *pm25Label;
@property (weak, nonatomic) IBOutlet UILabel *tempRangeLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *updateDateLabel;



@end
