//
//  FirstTableViewCell.m
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/16.
//  Copyright © 2018 techcul. All rights reserved.
//

#import "FirstTableViewCell.h"


@implementation FirstTableViewCell

BOOL isGreat = YES;
NSInteger currentIndex = 0;

+ (NSString *)cellIdentifier{
  return @"FirstTableViewCell";
}


- (void)awakeFromNib {
    [super awakeFromNib];
    clicked = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)updateByIndex:(NSUInteger)index withCars:(NSArray<Car *>*)cars{
    currentIndex = index;
    
    self.avatarImageView.image = [UIImage imageNamed:@"ski_new"];
    self.titleLabel.text = cars[index].maker;
    
    NSString *s = [[NSString alloc] initWithFormat:@"这是第%ld个cell", currentIndex];
    NSString *detail = @"";
    for (int i=0; i<currentIndex; i++) {
        detail = [detail stringByAppendingString:s];
    }
    self.detailLabel.text = detail;
    self.detailLabel.textColor = cars[index].color;
    
}
- (IBAction)infoAction:(id)sender {
    NSLog(@"infoAction: this is number %ld", currentIndex);
    clicked = !clicked;
    self.infoActionCallback();
}
@end
