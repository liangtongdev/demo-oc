//
//  UILabel+Demo2.m
//  property_dynamic
//
//  Created by liangtong on 2019/1/25.
//  Copyright © 2019 梁通. All rights reserved.
//

#import "UILabel+Demo2.h"
#import <objc/runtime.h>

NSString const *ltx_label_lineSpace = @"ltx_label_lineSpace";
NSString const *ltx_label_wordSpace = @"ltx_label_wordSpace";
@implementation UILabel (Demo2)
@dynamic ltx_lineSpace;
@dynamic ltx_wordSpace;

-(void)ltx_updateLabelLineSpace{
    NSString* text = self.text;
    NSInteger lineSpace = self.ltx_lineSpace;
    NSInteger wordSpace = self.ltx_wordSpace;
    if ([text length] > 0) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        if (lineSpace > 0) {
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:lineSpace];
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
        }
        if (wordSpace > 0) {
            [attributedString addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:wordSpace] range:NSMakeRange(0, [text length])];
        }
        self.attributedText = attributedString;
    }
}


#pragma mark - Getter && Setter
-(void)setLtx_lineSpace:(CGFloat)ltx_lineSpace{
    NSNumber* number = [NSNumber numberWithFloat:ltx_lineSpace];
    objc_setAssociatedObject(self, &ltx_label_lineSpace, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self ltx_updateLabelLineSpace];
}
-(CGFloat)ltx_lineSpace{
    NSNumber* number =  objc_getAssociatedObject(self, &ltx_label_lineSpace);
    return [number floatValue];
}

-(void)setLtx_wordSpace:(CGFloat)ltx_wordSpace{
    NSNumber* number = [NSNumber numberWithFloat:ltx_wordSpace];
    objc_setAssociatedObject(self, &ltx_label_wordSpace, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self ltx_updateLabelLineSpace];
}
-(CGFloat)ltx_wordSpace{
    NSNumber* number =  objc_getAssociatedObject(self, &ltx_label_wordSpace);
    return [number floatValue];
}
@end
