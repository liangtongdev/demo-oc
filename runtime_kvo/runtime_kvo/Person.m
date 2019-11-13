//
//  Person.m
//  runtime_kvo
//
//  Created by liangtong on 2019/1/26.
//  Copyright © 2019 梁通. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person
@synthesize name = _name;
@synthesize sex = _sex;

-(instancetype)init{
    self = [super init];
    if (self) {
        _name = @"liangtong";
        _sex = @"M";
    }
    return self;
}

/****
 * 重写description，展示更多信息
 ***/
-(NSString*)description{
    
    NSString* className = NSStringFromClass(object_getClass(self));
    NSString* superclass = NSStringFromClass(class_getSuperclass(object_getClass(self)));

    IMP setNameIMP = [self methodForSelector:@selector(setName:)];
    IMP setSexIMP = [self methodForSelector:@selector(setSex:)];
    
    NSString* desc = [NSString stringWithFormat:@"isa : %@ \n  \
                      superclass : %@ \n \
                      setName IMP : %p \n \
                      setSex IMP: %p",
                      className,superclass,setNameIMP,setSexIMP];
    return desc;
}


//阻止KVO
/**
 * 当key未name时候，不自动触发相关的setter
 **/
+ (BOOL) automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"name"]) {
        return NO;
    }
    return [super automaticallyNotifiesObserversForKey:key];
}

-(void)setSex:(NSString *)sex{
    _sex = sex;
    //通过手动调用setter，测试能否触发KVO
    [self willChangeValueForKey:@"name"];
    _name = @"Hello Ketty";
    [self didChangeValueForKey:@"name"];
}

@end
