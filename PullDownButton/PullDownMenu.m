//
//  PullDownMenu.m
//  PullDownButtonSampleProject
//
//  Created by Shingo Hashimoto on 13/07/23.
//  Copyright (c) 2013年 Shingo Hashimoto. All rights reserved.
//

#import "PullDownMenu.h"


@implementation PullDownMenu

@synthesize isDrawLine;

#pragma mark - View Life Cycles
/// @name View Life Cycles

/**
 初期化
 @param frame frame
 */
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTextAlignment:NSTextAlignmentCenter];
        [self setBackgroundColor:[UIColor lightGrayColor]];
    }
    return self;
}

/**
 描画
 @param rect rect
 */
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    if (self.isDrawLine > 0) {
        
        CGContextRef context = UIGraphicsGetCurrentContext();  // コンテキストを取得
        //  四辺を書く
        CGContextMoveToPoint(context, 5, 0);
        CGContextAddLineToPoint(context, self.frame.size.width - 10, 0);
        
        CGContextStrokePath(context);
    }
}

/**
 選択状態へ
 */
-(void)toSelected{
    [self setBackgroundColor:[UIColor darkGrayColor]];
}
/**
 非選択状態へ
 */
-(void)unSelected{
    [self setBackgroundColor:[UIColor lightGrayColor]];
}

@end