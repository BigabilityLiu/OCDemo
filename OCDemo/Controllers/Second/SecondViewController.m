//
//  SecondViewController.m
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/15.
//  Copyright © 2018 techcul. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headLabel;
@property (weak, nonatomic) IBOutlet UILabel *footLabel;
@property NSInteger counter;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.headLabel.text = @"Pose Demo";
    self.footLabel.text = @"0";
    self.counter = 0;
    
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
//    [self dismissViewControllerAnimated:true completion:^{
//        NSLog(@"dismiss");
//    }];
}

- (IBAction)addAction:(id)sender {
    self.counter += 1;
    self.footLabel.text = [[NSString alloc] initWithFormat:@"%ld",(long)self.counter];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)AddAction:(id)sender {
}
@end
