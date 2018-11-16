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
- (void)update{
    self.avatarImageView.image = [UIImage imageNamed:@"ski_new"];
    self.titleLabel.text = [[NSString alloc] initWithFormat:@"%ld", self.index];
    
    NSString *s = [[NSString alloc] initWithFormat:@"这是第%ld个cell", self.index];
    NSString *detail = @"";
    for (int i=0; i<self.index - 1; i++) {
        detail = [detail stringByAppendingString:s];
    }
    self.detailLabel.text = detail;
    
}
- (IBAction)infoAction:(id)sender {
    self.infoActionCallback();
    clicked = !clicked;
    NSLog(@"infoAction: this is number %ld", self.index);
}
@end
