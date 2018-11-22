//
//  Constants.h
//  OCDemo
//
//  Created by 刘大本事 on 2018/11/16.
//  Copyright © 2018 techcul. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Constants : NSObject

typedef NS_ENUM(NSInteger, VideoGameType){
    VideoGameRPG,
    VideoGameFPS
};
typedef NS_OPTIONS(NSInteger, PlayerType){
    PlayerTypeEnemy = 1 << 0, // 1
    PlayerTypeAlien = 1 << 1, // 2
    PlayerTypePlayer = 1 << 2 // 4
};

@end

NS_ASSUME_NONNULL_END
