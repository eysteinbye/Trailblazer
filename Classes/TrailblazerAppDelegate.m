//
//  TrailblazerAppDelegate.m
//  Trailblazer
//
//  Created by Eystein Bye on 7/14/10.
//  Copyright Adligo 2010. All rights reserved.
//




// Stedsnavn
//http://ws.geonames.org/findNearbyPlaceName?lat=61&lng=10
// Info på : http://www.geonames.org/export/web-services.html#findNearbyPlaceName
// http://www.geonames.org/export/reverse-geocoding.html

#import "TrailblazerAppDelegate.h"
#import "Speed.h"
#import "Location.h"

@implementation TrailblazerAppDelegate

@synthesize window;
@synthesize tabBarController;

CLLocationManager* locmanager;

- (float) posLatitude
{
	return posLatitude;
}

- (float) posLongitude
{
	return posLongitude;
}

-(void)awakeFromNib {
	UIApplication *thisApp = [UIApplication sharedApplication];
	thisApp.idleTimerDisabled = YES;
	
	[self update];
}

- (IBAction)update {
	locmanager = [[CLLocationManager alloc] init]; 
	[locmanager setDelegate:self]; // The locmanager calls methods in this class
	[locmanager setDesiredAccuracy:kCLLocationAccuracyBest];
	[locmanager startUpdatingLocation];
	// start the compass
	[locmanager startUpdatingHeading];
	
}

-(IBAction) showWeather {
	//The schema for the xml delivered by this product is available from http://api.yr.no/weatherapi/locationforecast/1.8/schema.
/*
	NSString *mapUrl = [NSString stringWithFormat: @"http://api.yr.no/weatherapi/locationforecast/1.8/?lat=%f;lon=%f", posLatitude, posLongitude]; 
	 NSURL *url = [NSURL URLWithString:mapUrl]; 
	 [[UIApplication sharedApplication] openURL:url];
*/	
	
	
	
	//
	
	NSString *mapUrl = [NSString stringWithFormat: @"http://api.wunderground.com/auto/wui/geo/GeoLookupXML/index.xml?query=%f,%f", posLatitude, posLongitude]; 
	NSURL *url = [NSURL URLWithString:mapUrl]; 
	[[UIApplication sharedApplication] openURL:url];
	
	
}
-(IBAction) showPictures {
	NSString *mapUrl = [NSString stringWithFormat: @"http://www.flickr.com/map/?fLat=%f&fLon=%f&zl=5", posLatitude, posLongitude]; 
	NSURL *url = [NSURL URLWithString:mapUrl]; 
	[[UIApplication sharedApplication] openURL:url];
}
-(IBAction) showMap {
	 NSString *mapUrl = [NSString stringWithFormat: @"http://maps.google.com/maps?q=%f,%f", posLatitude, posLongitude]; 
	 NSURL *url = [NSURL URLWithString:mapUrl]; 
	 [[UIApplication sharedApplication] openURL:url];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
    [window makeKeyAndVisible];
	return YES;
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{ 
	//if (wasFound) return; 
	//wasFound = YES;
	
	CLLocationCoordinate2D loc = [newLocation coordinate];
	
	[averageHeading setText: [Location enabled: newLocation.course]];
	[averageCardinal setText: [Location cardinalDirection: newLocation.course]];
	
	[status setText:[Location isIndoors: newLocation.course]];
	
	[longitude setText:[Location createSubdivisions:loc.longitude]];
	[latitude setText:[Location createSubdivisions:loc.latitude]];

	[altitudeM setText:	[NSString stringWithFormat: @"%.1f", newLocation.altitude]];
	[altitudeFeet setText:[Location meterToFeet:newLocation.altitude]];
	
	[accuracyH setText:[NSString stringWithFormat: @"%.1f", newLocation.horizontalAccuracy]];
	[accuracyV setText:[NSString stringWithFormat: @"%.1f", newLocation.verticalAccuracy]];
	
	[mps setText:  [Speed speedTomps:newLocation.speed]];
	[kph setText:  [Speed speedToKPH:newLocation.speed]];
	[mph setText:  [Speed speedToMPH:newLocation.speed]];
	[knop setText: [Speed speedToKnot:newLocation.speed]];
	
	
	myMap.showsUserLocation=TRUE;
	myMap.mapType=MKMapTypeHybrid;
	myMap.zoomEnabled=TRUE;
	
	
	posLatitude = loc.latitude;
	posLongitude = loc.longitude;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)heading {
	[x setText:[NSString stringWithFormat:@"%.1f", heading.x]];
	[y setText:[NSString stringWithFormat:@"%.1f", heading.y]];
	[z setText:[NSString stringWithFormat:@"%.1f", heading.z]];
	
	[magnetic setText:[NSString stringWithFormat:@"%.0f", heading.magneticHeading]];
	[trueNorth setText:[NSString stringWithFormat:@"%.0f", heading.trueHeading]];
	
	[cardinal setText: [Location cardinalDirection:heading.trueHeading]];
	
	[cardinalTrue setText: [Location cardinalDirection:heading.trueHeading]];
	[headingTrue setText:[NSString stringWithFormat:@"%.0f", heading.trueHeading]];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error 
{ 
	
}


/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

