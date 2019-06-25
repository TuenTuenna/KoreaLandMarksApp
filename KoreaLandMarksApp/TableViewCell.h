//
//  TableViewCell.h
//  KoreaLandMarksApp
//
//  Created by Jeff Jeong on 2019. 6. 25..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellAddress;
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;


@end

NS_ASSUME_NONNULL_END
