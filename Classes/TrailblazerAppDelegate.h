//
//  TrailblazerAppDelegate.h
//  Trailblazer
//
//  Created by Eystein Bye on 7/14/10.
//  Copyright Adligo 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h> 
#import <CoreLocation/CLLocationManagerDelegate.h> 
#import <MapKit/MapKit.h>
#import <MapKit/MKReverseGeocoder.h>

@interface TrailblazerAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
	
	CLLocationManager   *locmanager; 
	float				posLatitude;
	float				posLongitude;
	
	
	IBOutlet UILabel *mps;
	IBOutlet UILabel *kph;
	IBOutlet UILabel *mph;
	IBOutlet UILabel *knop;
	
	
	IBOutlet UILabel *longitude;
	IBOutlet UILabel *latitude;
	IBOutlet UILabel *accuracyH;
	IBOutlet UILabel *accuracyV;
	IBOutlet UILabel *altitudeM;
	IBOutlet UILabel *altitudeFeet;
	
	
	IBOutlet UILabel *x;
	IBOutlet UILabel *y;
	IBOutlet UILabel *z;
	
	IBOutlet UILabel *trueNorth;
	IBOutlet UILabel *magnetic;
	IBOutlet UILabel *cardinal;
	IBOutlet UILabel *status;

	IBOutlet UILabel *averageHeading;
	IBOutlet UILabel *averageCardinal;

	IBOutlet UILabel *cardinalTrue;
	IBOutlet UILabel *headingTrue;
	

	
	IBOutlet MKMapView *myMap;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;



- (IBAction)update;
- (IBAction)showMap;
- (IBAction) showWeather;
- (IBAction) showPictures;

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *) oldLocation ;
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *) error;

- (float) posLatitude;
- (float) posLongitude;



@end
