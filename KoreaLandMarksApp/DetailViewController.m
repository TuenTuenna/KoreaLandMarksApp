//
//  DetailViewController.m
//  KoreaLandMarksApp
//
//  Created by Jeff Jeong on 2019. 6. 25..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import "DetailViewController.h"
#import "MapPin.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

// 뷰가 로드되었을때
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 코너 라운드 주기
    self.mapView.layer.cornerRadius = 5;
    self.button.layer.cornerRadius = 5;
    
    //
    self.navigationItem.title = self.detailModel[0];
    self.detailTitle.text = self.detailModel[0];
    self.detailAddress.text = self.detailModel[1];
    self.detailImage.image = [UIImage imageNamed:self.detailModel[2]];
    
    self.detailDescription.text = self.detailModel[3];
    
    // 지도 위치 설정
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    
    CLLocationCoordinate2D location;
    location.latitude = [self.detailModel[4] doubleValue];
    location.longitude = [self.detailModel[5] doubleValue];
    
    region.span = span;
    region.center = location;
    
    // 맵뷰를 설정한다.
    [self.mapView setRegion:region animated:YES];
    
    // 맵핀을 가져온다.
    MapPin *annotation = [[MapPin alloc] init];
    
    // 위에서 가져온 지도위치를 맵핀의 위치로 설정한다.
    annotation.coordinate = location;
    
    // 맵뷰에 맵핀을 표시한다.
    [self.mapView addAnnotation:annotation];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)directions:(id)sender {
    
    // URL 로 연다.
    // http://maps.apple.com/?daddr=위도,경도
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/?daddr=%@,%@", self.detailModel[4], self.detailModel[5]]] options:@{} completionHandler:nil];
    
}


@end
