//
//  ViewController.m
//  runtime_kvo
//
//  Created by liangtong on 2019/1/26.
//  Copyright © 2019 梁通. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person* person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _person = [[Person alloc] init];
    
    NSLog(@"Before Observe---------------->\n %@",_person);
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [_person addObserver:self forKeyPath:@"name" options:options context:@"123"];

    
    NSLog(@"After Observe---------------->\n %@",_person);
//    _person.name = @"joker";
    _person.sex = @"F";
}


// 当监听对象的属性值发生改变时，就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}

-(void)dealloc{
    [_person removeObserver:self forKeyPath:@"name"];
    _person = nil;
}

@end
