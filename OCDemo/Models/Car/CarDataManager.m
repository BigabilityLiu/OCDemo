//
//  CarDataManager.m
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/21.
//  Copyright © 2018 techcul. All rights reserved.
//

#import "CarDataManager.h"

@interface CarDataManager ()
@property NSMutableArray<Car *>* cars;
@end

static CarDataManager * _manager;

@implementation CarDataManager

+ (instancetype)instance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[CarDataManager alloc] init];
    });
    return _manager;
}
+ (instancetype)alloc{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[super alloc] init];
    });
    return _manager;
}
- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return _manager;
}

- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    return _manager;
}

- (void)refresh:(void (^)(NSArray<Car *>* cars))block{
    if (_manager.cars.count == 0) {
        Car *mustang = [[Car alloc] initWithMaker:@"Ford" color: UIColor.blueColor];
        Car *audiA8 = [[Car alloc] initWithMaker:@"Audi" color: UIColor.blackColor];
        _manager.cars = [[NSMutableArray alloc] initWithObjects:mustang, audiA8, nil];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            block(_manager.cars);
        });
    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        sleep(3);
//        block(_manager.cars);
//    });
    
}
- (void)addCar:(Car *)car{
    [_manager.cars addObject:car];
}
- (void)removeLast{
    [_manager.cars removeLastObject];
}
@end
