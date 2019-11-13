//
//  TestClass.h
//  runtime_objc_msgSend
//
//  Created by liangtong on 2019/1/23.
//  Copyright © 2019 梁通. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

-(void)sayHello;
-(void)sayBye;

@end

@interface Student : Person

-(void)sayHello;

-(void)dynamicAnalysisMethod;

-(void)reSignatureMethod;

@end

@interface Worker : NSObject

-(void)sayHello;

-(void)reSignature;

@end

NS_ASSUME_NONNULL_END
