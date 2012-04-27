//
//  Speed.m
//  Trailblazer
//
//  Created by Eystein Bye on 7/14/10.
//  Copyright 2010 Adligo. All rights reserved.
//

#import "Speed.h"


@implementation Speed


+ (NSString *) speedTomps: (float) value{
	NSString *myString = @"0.0";
	if (value>0) {
		myString = [NSString stringWithFormat: @"%.1f", value];
	}
	return myString;        
}


+ (NSString *) speedToKPH: (float) value{
	NSString *myString = @"0.0";
	if (value>0) {
		float kph = value * 3.6f;
		myString = [NSString stringWithFormat: @"%.1f", kph];
	}
	return myString;        
}


+ (NSString *) speedToMPH: (float) value{
	NSString *myString = @"0.0";
	if (value>0) {
		float mile = 1609.344f;
		float mph = value / mile * 3600;
		myString = [NSString stringWithFormat: @"%.1f", mph];
	}
	return myString;        
}

+ (NSString *) speedToKnot: (float) value{
	NSString *myString = @"0.0";
	if (value>0) {
		float nauticMile = 1852.0f;
		float knots = value / nauticMile * 3600;
		myString = [NSString stringWithFormat: @"%.1f", knots];
	}
	return myString;        
}

@end
