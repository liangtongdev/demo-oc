//
//  TestClass.m
//  runtime_objc_msgSend
//
//  Created by liangtong on 2019/1/23.
//  Copyright © 2019 梁通. All rights reserved.
//

#import "TestClass.h"
#import <objc/runtime.h>

@implementation Person

-(void)sayHello{
    NSLog(@"%s",__func__);
}
-(void)sayBye{
    NSLog(@"%s",__func__);
}
@end

#pragma clang diagnostic ignored "-Wincomplete-implementation"
#pragma clang diagnostic ignored "-Warc-unsafe-retained-assign"
@implementation Student

-(void)sayHello{
    NSLog(@"%s",__func__);
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(dynamicAnalysisMethod)) {
        Method method = class_getInstanceMethod([self class], @selector(dynamicAnalysisOther));
        class_addMethod([self class],
                        sel,
                        method_getImplementation(method),
                        method_getTypeEncoding(method));
        return true;
    }
    return [super resolveInstanceMethod:sel];
}

-(void)dynamicAnalysisOther{
    NSLog(@"%s",__func__);
}

-(void)reSignatureMethod{
    NSLog(@"%s",__func__);
}

@end

@implementation Worker
-(id)forwardingTargetForSelector:(SEL)aSelector{
    if (aSelector == @selector(sayHello)) {
        return [[Student alloc] init];
    }
    return nil;
}

-(NSMethodSignature*)methodSignatureForSelector:(SEL)sel{
    if (sel == @selector(reSignature)) {
        NSMethodSignature* signature = [[[Student alloc]
                                         init]
                                        methodSignatureForSelector:@selector(reSignatureMethod)];
        return signature;
    }
    
    return [super methodSignatureForSelector:sel];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"%s",__func__);
    if (anInvocation.selector == @selector(reSignatureMethod)) {
        anInvocation.target = [[Student alloc] init];
        [anInvocation invoke];
        
        //或者如下形式
        //[anInvocation invokeWithTarget:[[Student alloc] init]];
    }
    
}
@end

