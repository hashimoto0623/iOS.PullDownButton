//
//  PullDownButton.h
//  SmartKitchenDisplay
//
//  Created by Shingo Hashimoto on 13/01/16.
//  Copyright (c) 2013年 Shingo Hashimoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullDownMenu.h"

/** 
 プルダウンメニューを開くボタンクラス。
 */
@interface PullDownButton : UIView

@property (nonatomic, copy) void (^successBlock)(int);

/** @name Public Methods */
-(id)initWithFrame:(CGRect)frame withTitle:(NSString*)title withMenuStrings:(NSMutableArray*)strings;

@end

