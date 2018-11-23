//
//  SecondViewController.m
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/15.
//  Copyright © 2018 techcul. All rights reserved.
//

#import "SecondViewController.h"
#import "Car.h"
#import "CarDataManager.h"

@interface SecondViewController (){
    NSInteger _counter;
}
@property (weak, nonatomic) IBOutlet UILabel *headLabel;
@property (weak, nonatomic) IBOutlet UILabel *footLabel;
@property NSInteger counter;
@end

@implementation SecondViewController
@dynamic counter;
- (NSInteger)counter{
    return _counter;
}
- (void)setCounter:(NSInteger)counter{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    _counter = counter;
    self.footLabel.text = [[NSString alloc] initWithFormat:@"%ld",(long)counter];
    
}
- (IBAction)back:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.lightGrayColor;
    
    self.headLabel.text = @"Pose Demo";
    self.footLabel.text = @"0";
    
    [[CarDataManager instance] refresh:^(NSArray<Car *> * _Nonnull cars) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        self.counter = cars.count;
    }];
    
}
- (IBAction)deleteAction:(id)sender {
    [[CarDataManager instance] removeLast];
    self.counter -= 1;
}

- (IBAction)addAction:(id)sender {
    
    Car *car = [[Car alloc] initWithMaker:self.footLabel.text color:UIColor.greenColor];
    [[CarDataManager instance] addCar:car];
    self.counter += 1;
}

@end
