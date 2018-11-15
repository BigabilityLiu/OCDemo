//
//  FirstViewController.m
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/15.
//  Copyright © 2018 techcul. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FirstViewController

static NSString *cellIdentifier = @"CELL_IDENTIFIER";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:UITableViewCell.self forCellReuseIdentifier:cellIdentifier];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)present:(id)sender {
    NSLog(@"ready for present");
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:true];
//    [self presentViewController:secondVC animated:true completion:^{
//        NSLog(@"present completion");
//    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"%ld", (long)indexPath.row];
    return cell;
}

@end


