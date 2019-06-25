//
//  DetailViewController.h
//  KoreaLandMarksApp
//
//  Created by Jeff Jeong on 2019. 6. 25..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController {
    
    
    
}

// 디테일 모델 
@property(strong, nonatomic) NSArray *detailModel;


@property (weak, nonatomic) IBOutlet UILabel *detailTitle;
@property (weak, nonatomic) IBOutlet UILabel *detailAddress;
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UITextView *detailDescription;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)directions:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *button;



@end

NS_ASSUME_NONNULL_END
