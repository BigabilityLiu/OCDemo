//
//  FirstViewController.m
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/15.
//  Copyright © 2018 techcul. All rights reserved.
//

#import "FirstViewController.h"
#import "Car.h"
#import "CarDataManager.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) NSArray <Car *> *cars;

@end

@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"FirstTableViewCell" bundle:nil]
         forCellReuseIdentifier:[FirstTableViewCell cellIdentifier]];
}
- (void)setupData {
    [[CarDataManager instance] refresh];
    self.cars = [[CarDataManager instance] getAll];
    
    [self.tableView reloadData];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupData];
}

- (IBAction)present:(id)sender {
    NSLog(@"ready for present");
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:true];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cars.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[FirstTableViewCell cellIdentifier]
                                                               forIndexPath:indexPath];
    
    if (cell == nil) {
        NSLog(@"nil cell");
    }
    [cell updateByIndex:indexPath.row withCars:self.cars];
    cell.infoActionCallback = ^{
        [self present:UIButton.new];
    };
    
    return cell;
}

@end


