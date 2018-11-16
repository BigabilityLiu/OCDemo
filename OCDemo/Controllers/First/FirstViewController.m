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


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
//    [self.tableView registerClass:[FirstTableViewCell class]
//           forCellReuseIdentifier:[FirstTableViewCell cellIdentifier]];
    [self.tableView registerNib:[UINib nibWithNibName:@"FirstTableViewCell" bundle:nil]
         forCellReuseIdentifier:[FirstTableViewCell cellIdentifier]];
}
- (IBAction)present:(id)sender {
    NSLog(@"ready for present");
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:true];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[FirstTableViewCell cellIdentifier]
                                                               forIndexPath:indexPath];
    if (cell == nil) {
        NSLog(@"nil cell");
    }
    cell.index = indexPath.row + 1;
    [cell update];
    cell.infoActionCallback = ^{
        NSLog(@"call back from cell");
    };
    
    return cell;
}

@end


