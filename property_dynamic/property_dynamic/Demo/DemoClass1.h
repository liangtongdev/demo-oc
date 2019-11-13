//
//  DemoClass1.h
//  property_dynamic
//
//  Created by liangtong on 2019/1/25.
//  Copyright © 2019 梁通. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/***
 * 用来展示通过私有变量来实现@dynamic
 * 用于隐藏某些信息
 ***/
@interface DemoClass1 : NSObject
@property (nonatomic , strong) NSString* dynamicVar;
@end

NS_ASSUME_NONNULL_END
