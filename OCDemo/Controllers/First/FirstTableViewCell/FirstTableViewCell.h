//
//  FirstTableViewCell.h
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/16.
//  Copyright © 2018 techcul. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstTableViewCell : UITableViewCell
{
    BOOL clicked;
}
+ (NSString *)cellIdentifier;


@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
- (IBAction)infoAction:(id)sender;

@property (assign, nonatomic) NSInteger index;
- (void)update;
@property (nonatomic, copy, nullable) void (^infoActionCallback)(void);

@end

NS_ASSUME_NONNULL_END
