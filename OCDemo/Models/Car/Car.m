//
//  Car.m
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/16.
//  Copyright © 2018 techcul. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)initWithMaker:(NSString *)maker color:(UIColor *)color{
    if ((self = [super init])) {
        _maker = maker;
        _color = color;
    }
    return self;
}
- (void) turnOn{
    NSLog(@"turn On");
}
- (void) accelerate{
    NSLog(@"accelerate!");
}

@end
