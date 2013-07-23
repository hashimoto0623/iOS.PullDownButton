//
//  BRMainViewController.m
//  PullDownButtonSampleProject
//
//  Created by Shingo Hashimoto on 13/07/23.
//  Copyright (c) 2013年 Shingo Hashimoto. All rights reserved.
//

#import "BRMainViewController.h"
#import "PullDownButton.h"

@interface BRMainViewController ()

@end

@implementation BRMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    PullDownButton *pbutton = [[[PullDownButton alloc] initWithFrame:CGRectMake(10, 100, 300, 30) withTitle:@"選択" withMenuStrings:[NSMutableArray arrayWithObjects:@"1", @"2",nil]] autorelease];
    pbutton.successBlock = ^(int index){
        UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@""
                                                         message:[NSString stringWithFormat:@"selected at index:%d",index] delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil] autorelease];
        [alert show];
    };
    [self.view addSubview:pbutton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
