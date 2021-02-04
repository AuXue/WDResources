//
//  UIFont+WDCategory.m
//  WDResources_Example
//
//  Created by 杨启佳 on 2021/2/4.
//  Copyright © 2021 WDResources. All rights reserved.
//

#import "UIFont+WDCategory.h"
#import <CoreText/CTFont.h>
#import <CoreText/CTFontManager.h>

@implementation UIFont (WDCategory)

//MARK: 根据字体路劲获取字体
/// @param path 路劲
/// @param size 字号
+(UIFont *)fontWithPath:(NSString*)path size:(CGFloat)size
{
    CFStringRef fontPath = CFStringCreateWithCString(NULL, [path UTF8String], kCFStringEncodingUTF8);
    CFURLRef fontUrl = CFURLCreateWithFileSystemPath(NULL, fontPath, kCFURLPOSIXPathStyle, 0);
    CFArrayRef fontArray = CTFontManagerCreateFontDescriptorsFromURL(fontUrl);
    CTFontManagerRegisterFontsForURL(fontUrl, kCTFontManagerScopeNone, NULL);
    NSMutableArray *customFontArray = [NSMutableArray array];
    for (CFIndex i = 0 ; i < CFArrayGetCount(fontArray); i++){
        CTFontDescriptorRef  descriptor = CFArrayGetValueAtIndex(fontArray, i);
        CTFontRef fontRef = CTFontCreateWithFontDescriptor(descriptor, size, NULL);
        NSString *fontName = CFBridgingRelease(CTFontCopyName(fontRef, kCTFontPostScriptNameKey));
        UIFont *font = [UIFont fontWithName:fontName size:size];
        [customFontArray addObject:font];
    }
    return customFontArray.firstObject;
}

@end
