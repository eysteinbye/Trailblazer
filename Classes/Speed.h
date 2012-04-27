//
//  Speed.h
//  Trailblazer
//
//  Created by Eystein Bye on 7/14/10.
//  Copyright 2010 Adligo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Speed : NSObject {

}

+ (NSString *) speedTomps: (float) value;
+ (NSString *) speedToKPH: (float) value;
+ (NSString *) speedToMPH: (float) value;
+ (NSString *) speedToKnot: (float) value;


@end
