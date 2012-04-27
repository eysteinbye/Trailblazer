//
//  Location.m
//  WhereAmI
//
//  Created by Eystein Bye on 7/13/10.
//  Copyright 2010 Adligo. All rights reserved.
//

#import "Location.h"


@implementation Location


+ (NSString *) createSubdivisions: (float) value{
	int degrees = value;
	double decimal = fabs(value - degrees);
	int minutes = decimal * 60;
	double seconds = decimal * 3600 - minutes * 60;
	NSString *result = [NSString stringWithFormat:@"%d° %d' %1.4f\"", degrees, minutes, seconds];
	return result;
}


+ (NSString *) enabled: (float) value{
	NSString *myString;
	if (value>=0.0f) {
		myString = [NSString stringWithFormat: @"%f", value];
	}else {
		myString = @"Not moving";
	}
	return myString;   
}


+ (NSString *) isIndoors: (float) value{
	NSString *myString;
	if (value>=0.0f) {
		myString = @"OK";
	}else {
		myString = @"Are you indoors?";
	}
	return myString;   
}

+ (NSString *) cardinalDirection: (float) deg{
	
	
	NSString *myString = @"";
	
	if (deg>=0.0f) {
		if (deg > 348.75f || deg <= 11.25f) {
			myString = @"| N";
		}
		if (deg > 11.25f && deg <= 33.75f) {
			myString = @"  NNE";
		}
		if (deg > 33.75f && deg <= 56.25f) {
			myString = @"/ NE";
		}
		if (deg > 56.25f && deg <= 78.75f) {
			myString = @"  ENE";
		}
		if (deg > 78.75f && deg <= 101.25f) {
			myString = @"- E";
		}
		if (deg > 101.25f && deg <= 112.5f) {
			myString = @"  ESE";
		}
		if (deg > 112.5f && deg <= 146.25f) {
			myString = @"  SE";
		}
		if (deg > 146.25f && deg <= 168.75f) {
			myString = @"  SSE";
		}
		if (deg > 168.75f && deg <= 191.25f) {
			myString = @"| S";
		}
		if (deg > 191.25f && deg <= 213.75f) {
			myString = @"  SSW";
		}
		if (deg > 213.75f && deg <= 236.25f) {
			myString = @"/ SW";
		}
		if (deg > 236.25f && deg <= 258.75f) {
			myString = @"  WSW";
		}
		if (deg > 258.75f && deg <= 281.25f) {
			myString = @"- W";
		}
		if (deg > 281.25f && deg <= 303.75f) {
			myString = @"  WNW";
		}
		if (deg > 303.75f && deg <= 326.25f) {
			myString = @"  NW";
		}
		if (deg > 326.25f && deg <= 348.75f) {
			myString = @"  NNW";
		}
	}
	
	// do something with myString
	return myString;        
}




+ (NSString *) meterToFeet: (float) value{
	float feet = value * 3.2808399f;
	NSString *myString = @"0";
	if (value>=0.0f) {
		myString = [NSString stringWithFormat: @"%.1f", feet];
	}
	return myString;
}




@end
