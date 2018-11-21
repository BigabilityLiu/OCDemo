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
    _counter = counter;
    self.footLabel.text = [[NSString alloc] initWithFormat:@"%ld",(long)counter];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headLabel.text = @"Pose Demo";
    self.footLabel.text = @"0";
    self.counter = [[CarDataManager instance] getAll].count;
    
}
- (IBAction)deleteAction:(id)sender {
    self.counter -= 1;
    [[CarDataManager instance] removeLast];
}

- (IBAction)addAction:(id)sender {
    self.counter += 1;
    
    Car *car = [[Car alloc] initWithMaker:self.footLabel.text color:UIColor.greenColor];
    [[CarDataManager instance] addCar:car];
}

@end
