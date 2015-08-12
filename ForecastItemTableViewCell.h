//
//  ForecastItemTableViewCell.h
//  Anything
//
//  Created by 洪浩 on 15/8/7.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForecastItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *weekdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;

@end
