//
//  Car.m
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/16.
//  Copyright © 2018 techcul. All rights reserved.
//

#import "Car.h"
// 可在这里申明内部函数和方法 
@interface Car ()

@property BOOL goodToRun;


@end

@implementation Car

- (instancetype)initWithMaker:(NSString *)maker color:(UIColor *)color{
    if ((self = [super init])) {
        _maker = maker;
        _color = color;
        _goodToRun = YES;
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
