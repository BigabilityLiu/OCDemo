//
//  Car.h
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/16.
//  Copyright © 2018 techcul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject

@property NSString *make;
@property UIColor *color;

- (void) turnOn;
- (void) accelerate;

@end

NS_ASSUME_NONNULL_END
