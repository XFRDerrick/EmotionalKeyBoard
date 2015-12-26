//
//  DemoViewController.m
//  EmojiFace
//
//  Created by 赫腾飞 on 15/12/26.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "DemoViewController.h"

#import "EmojiFace-swift.h"

#import "NSString+Emoji.h"
@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"0x1f603jjj";
    NSLog(@"%@",str.emojiStr);
    NSLog(@"%@",str.emoji);
    NSLog(@"%@",[NSString emojiWithStringCode:str]);
    NSLog(@"%d",str.isEmoji);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
