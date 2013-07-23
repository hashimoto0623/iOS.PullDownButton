//
//  PullDownButton.m
//  SmartKitchenDisplay
//
//  Created by Shingo Hashimoto on 13/01/16.
//  Copyright (c) 2013年 Shingo Hashimoto. All rights reserved.
//

#import "PullDownButton.h"

@interface PullDownButton (){
    NSMutableArray *_datalist;
    UIView *_menuview;
    UILabel *_btnlabel;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)showMenu;
-(void)hideMenu;
@end


@implementation PullDownButton
#pragma mark - View Life Cycles
/// @name View Life Cycles

/**
 解放
 */
-(void)dealloc{
    
    [_datalist release];
    [_menuview release];
    [_btnlabel release];
    Block_release(_successBlock);
    [super dealloc];
}

/**
 初期化
 各種Viewの初期化、及び表示するテキストの配列をdatalistに格納する
 @param frame frame
 @param title title
 @param strings strings
 */
- (id)initWithFrame:(CGRect)frame withTitle:(NSString*)title withMenuStrings:(NSMutableArray*)strings
{
    self = [super initWithFrame:frame];
    if (self) {
        //  展開するプルダウンテキストを配列に格納
        _datalist = [[NSMutableArray arrayWithArray:strings] retain];
        
        //  背景を塗る
        [self setBackgroundColor:[UIColor grayColor]];
    
        //  ボタンラベルを生成する
        UILabel *lbl = [[[UILabel alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height)] autorelease];
        [lbl setBackgroundColor:[UIColor clearColor]];
        [lbl setTextColor:[UIColor whiteColor]];
        [lbl setTextAlignment:NSTextAlignmentCenter] ;
        lbl.text = [NSString stringWithFormat:@"%@ ▼",title];
        _btnlabel = [lbl retain];
        [self addSubview:lbl];
        
        //  オープン状態で表示するViewを生成する
        _menuview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, [strings count] * self.frame.size.height)];
        
        //  PullDownMenuを生成し、menuviewに追加する
        int i=0;
        for (NSString *mt in _datalist){
            PullDownMenu *pm = [[[PullDownMenu alloc] initWithFrame:CGRectMake(0, (i + 1)*self.frame.size.height, self.frame.size.width, self.frame.size.height)] autorelease];
            if (i!=0) {
                pm.isDrawLine = 1;
            }
            i++;
            pm.text = mt;
            [_menuview addSubview:pm];
        }
        
        //  パーツを追加し、menuviewを隠しておく
        [self addSubview:_menuview];
        [_menuview setHidden:YES];


    }
    return self;
}


#pragma mark - Other Methods
/// @name Other Methods

/**
 タップ、ドラッグ開始
 @param touches touches
 @param event event
 */
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self showMenu];
}


/**
 タップ、ドラッグ終了
 選択されたメニューを検索し、delegateに送付
 @param touches touches
 @param event event
 */
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    // 何番目のメニューが選ばれているかを座標から検索する
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:_menuview];
    int i=0;
    for (PullDownMenu *m in [_menuview subviews]) {
        if (CGRectIntersectsRect(CGRectMake(p.x, p.y, 1, 1), m.frame)) {
            _btnlabel.text = [NSString stringWithFormat:@"%@",[_datalist objectAtIndex:i]];
            if (_successBlock) {
                _successBlock(i);
            }
            break;
        }
        i++;
    }
    
    [self hideMenu];
}

/**
 ドラッグ
 選択中のメニューを色付けする
 @param touches touches
 @param event event
 */
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    // 何番目のメニューが選ばれているかを座標から検索する
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:_menuview];
    for (PullDownMenu *m in [_menuview subviews]) {
        if (CGRectIntersectsRect(CGRectMake(p.x, p.y, 1, 1), m.frame)) {
            [m toSelected];
        }else{
            [m unSelected];
        }
    }
    
}
/** menuviewを表示する */
-(void)showMenu{
    [_menuview setHidden:NO];
}
/** menuviewを隠す */
-(void)hideMenu{
    [_menuview setHidden:YES];
}


@end




