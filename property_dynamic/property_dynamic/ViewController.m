//
//  ViewController.m
//  property_dynamic
//
//  Created by liangtong on 2019/1/25.
//  Copyright © 2019 梁通. All rights reserved.
//

#import "ViewController.h"
#import "DemoClass1.h"
#import "UILabel+Demo2.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /***
     * 通过私有变量来实现@dynamic的存取方法
     * 用于隐藏某些信息
     ***/
    DemoClass1* demo1 = [[DemoClass1 alloc] init];
    NSLog(@"Before - DemoClass1's dynamicVar is :%@", demo1.dynamicVar);
    demo1.dynamicVar = @"Set dynamicVar";
    NSLog(@"After - DemoClass1's dynamicVar is :%@", demo1.dynamicVar);
    
    
    //设置UILabel的行间距和字间距
    self.label.ltx_lineSpace = 8;
    self.label.ltx_wordSpace = 4;
}


@end
