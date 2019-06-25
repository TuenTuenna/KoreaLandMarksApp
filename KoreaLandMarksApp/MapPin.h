//
//  MapPin.h
//  KoreaLandMarksApp
//
//  Created by Jeff Jeong on 2019. 6. 26..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapPin : NSObject <MKAnnotation> {
    
    CLLocationCoordinate2D coordinate;
    
    
}


@property(nonatomic, assign) CLLocationCoordinate2D coordinate;





@end

NS_ASSUME_NONNULL_END
