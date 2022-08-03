//
//  GTLocation.h
//  FirstApp
//
//  Created by Yang Gao on 2022/8/3.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN

@interface GTLocation : NSObject <CLLocationManagerDelegate>
@property (nonatomic, strong, readwrite) CLLocationManager *locationManager;

+ (GTLocation *)locationManager;
- (void) checkLocationAuthorization;

@end

NS_ASSUME_NONNULL_END
