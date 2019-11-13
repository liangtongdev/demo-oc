//
//  DemoClass1.m
//  property_dynamic
//
//  Created by liangtong on 2019/1/25.
//  Copyright © 2019 梁通. All rights reserved.
//

#import "DemoClass1.h"

@interface DemoClass1()

@property (nonatomic, strong) NSString* privateVar;

@end

@implementation DemoClass1
@dynamic dynamicVar;
@synthesize privateVar = _privateVar;

- (void)setDynamicVar:(NSString *)dynamicVar{
    self.privateVar = dynamicVar;
}
-(NSString*)dynamicVar{
    return self.privateVar;
}

-(void)setPrivateVar:(NSString *)privateVar{
    _privateVar = privateVar;
}
-(NSString*)privateVar{
    if (!_privateVar) {
        _privateVar = @"This is private var";
    }
    return _privateVar;
}
@end
