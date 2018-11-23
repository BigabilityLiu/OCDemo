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

@interface FirstViewController (){
    SecondViewController *secondVC;
}

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
    [self setupData];
}
- (void)setupData {
    [[CarDataManager instance] refresh:^(NSArray<Car *> * _Nonnull cars) {
        self.cars = cars;
        [self.tableView reloadData];
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (IBAction)present:(id)sender {
    secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
    [secondVC addObserver:self
           forKeyPath:@"counter"
              options:NSKeyValueObservingOptionNew context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isEqual:secondVC] && [keyPath isEqualToString:@"counter"]) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        [self setupData];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
- (void)dealloc
{
    [secondVC removeObserver:self forKeyPath:@"counter"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cars.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[FirstTableViewCell cellIdentifier]
                                                               forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = FirstTableViewCell.new;
        NSLog(@"nil cell");
    }
    [cell updateByIndex:indexPath.row withCars:self.cars];
    cell.infoActionCallback = ^{
        [self present:UIButton.new];
    };
    
    return cell;
}

@end


