//
//  ViewController.m
//  runtime_objc_msgSend
//
//  Created by liangtong on 2019/1/23.
//  Copyright © 2019 梁通. All rights reserved.
//

#import "ViewController.h"
#import "TestClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"---------------消息发送:\n");
    [self testMsgSend];
    
    NSLog(@"---------------动态方法解析:\n");
    [self testDynamicAnalysis];
    
    NSLog(@"---------------消息转发:\n");
    [self testForward];
}

#pragma mark - 消息发送
/***
 * 消息发送测试
 *
 ****/
-(void)testMsgSend{
    //1.1 如果接收者类的cache中能找到方法，则直接调用。否则从接受者类的方法列表中查找方法，找到后添加到cache中
    Student* student = [[Student alloc] init];
    [student sayHello];
    //1.2 以上两个步骤均找不到的时候，从superClass的cache中查找，同 1.1
    [student sayBye];
}


#pragma mark - 动态方法解析
/***
 * 动态方法解析测试
 *
 ****/
-(void)testDynamicAnalysis{
    Student* student = [[Student alloc] init];
    //针对类和实例对象方法。
    //2.1重写NSObject的方法 + (BOOL)resolveClassMethod:(SEL)sel 或 + (BOOL)resolveInstanceMethod:(SEL)sel
    //2.2在方法中对方法进行动态解析。
    [student dynamicAnalysisMethod];
}




#pragma mark - 消息转发
/***
 * 消息转发测试
 *
 ****/
-(void)testForward{
    Worker* worker = [[Worker alloc] init];
    //直接转发
    //3.1 重写NSObject的方法 - (id)forwardingTargetForSelector:(SEL)aSelector
    //返回 消息接收者对象
    [worker sayHello];
    
    //方法重签名。
    //如果3.1转发方法返回的是nil。则可以通过重新签名的方式来实现
    //4.1 重写NSObject的类/实例方法 - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector 或 + (NSMethodSignature *)instanceMethodSignatureForSelector:(SEL)aSelector
    //4.2 在方法中，返回新方法的方法签名
    //4.3 重写NSObject的方法 - (void)forwardInvocation:(NSInvocation *)anInvocation
    //根据签名等信息，对NSInvocation的target进行赋值。然后invoke唤醒
    [worker reSignature];
}

@end
