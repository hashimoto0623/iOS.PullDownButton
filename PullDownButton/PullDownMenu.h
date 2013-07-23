//
//  PullDownMenu.h
//  PullDownButtonSampleProject
//
//  Created by Shingo Hashimoto on 13/07/23.
//  Copyright (c) 2013年 Shingo Hashimoto. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 プルダウンで表示されるメニュー
 */
@interface PullDownMenu : UILabel

/// @name Properties

/// 下線フラグ
@property (readwrite) int isDrawLine;

/// @name Public Methods

-(void)toSelected;
-(void)unSelected;

@end