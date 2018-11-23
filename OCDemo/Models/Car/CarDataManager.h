//
//  CarDataManager.h
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/21.
//  Copyright © 2018 techcul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
NS_ASSUME_NONNULL_BEGIN

@interface CarDataManager : NSObject

//TODO: 或者建立Car protocol来实现方法

+ (instancetype)instance;

- (void)refresh:(void (^)(NSArray<Car *>* cars))block;
- (void)addCar:(Car *)car;
- (void)removeLast;

@end

NS_ASSUME_NONNULL_END
