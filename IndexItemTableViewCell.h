//
//  IndexItemTableViewCell.h
//  Anything
//
//  Created by 洪浩 on 15/8/7.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *indexPicImageView;
@property (weak, nonatomic) IBOutlet UILabel *indexTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *indexDegreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *indexDescLabel;

@end
