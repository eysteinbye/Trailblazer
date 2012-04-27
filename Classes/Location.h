//
//  Location.h
//  WhereAmI
//
//  Created by Eystein Bye on 7/13/10.
//  Copyright 2010 Adligo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Location : NSObject {
	
	
}

+ (NSString *) createSubdivisions: (float) value;

+ (NSString *) isIndoors: (float) value;
+ (NSString *) enabled: (float) value;

+ (NSString *) cardinalDirection: (float) deg;


+ (NSString *) meterToFeet: (float) value;

@end
