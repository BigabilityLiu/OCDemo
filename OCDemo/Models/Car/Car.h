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
@protocol CarFunctionsDelegate <NSObject>

- (void) turnOn;
- (void) accelerate;

@end

@interface Car : NSObject

@property NSString *maker;
@property UIColor *color;
@property id<CarFunctionsDelegate> delegate;

- (instancetype)initWithMaker:(NSString *)maker color:(UIColor *)color;
- (void) turnOn;
- (void) accelerate;

@end

NS_ASSUME_NONNULL_END
