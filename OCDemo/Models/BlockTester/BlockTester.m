//
//  BlockTester.m
//  OCDemo
//
//  Created by 刘大本事 on 2018/11/19.
//  Copyright © 2018 techcul. All rights reserved.
//

#import "BlockTester.h"

@interface BlockTester()

@property (nonatomic, copy) void (^block)(id, NSUInteger, BOOL*);

@end

@implementation BlockTester

- (void)runTests{
    
    // 1 - Creating and calling a block
    void (^MyBlock)(id, NSUInteger, BOOL*) = ^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"Video game: %@", (NSString *)obj);
    };
    
    BOOL stop;
    MyBlock(@"西游记", 0, &stop);
    
    // 2 - Passing a block to a method
    NSArray *videoGames = @[@"红楼梦", @"三国演义",@"水浒传"];
    [videoGames enumerateObjectsUsingBlock: MyBlock];
    
    // 3 - Inline form
    NSString *favoriteGame = @"水浒传";
    __block int countOfGames = 0;
    [videoGames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([(NSString *)obj isEqualToString: favoriteGame]) {
            NSLog(@"Wow ,%@ is my favorite game", (NSString *)obj);
        }else{
            NSLog(@"Video game: %@", (NSString *)obj);
        }
        countOfGames++;
    }];
    NSLog(@"Total %d videogames", countOfGames);
    // 4 -
    __weak BlockTester *weakSelf = self;
    [self doSomethingWithBlock:^(id obj, NSUInteger inx, BOOL *stop) {
        [weakSelf logDone];
    }];
}

- (void) logDone{
    NSLog(@"Done");
}

- (void)doSomethingWithBlock:(void (^)(id obj, NSUInteger inx, BOOL *stop))block {
    self.block = block;
    [self performSelector:@selector(afterOneSecond) withObject:nil afterDelay:1.0];
}


- (void)afterOneSecond {
    BOOL stop;
    self.block(@"合金弹头", 0, &stop);
}

- (void)dealloc{
    NSLog(@"dealloc");
}
@end
