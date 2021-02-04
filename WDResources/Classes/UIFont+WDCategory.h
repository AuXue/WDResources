//
//  UIFont+WDCategory.h
//  WDResources_Example
//
//  Created by 杨启佳 on 2021/2/4.
//  Copyright © 2021 WDResources. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (WDCategory)

//MARK: 根据字体路劲获取字体
/// @param path 路劲
/// @param size 字号
+(UIFont *)fontWithPath:(NSString*)path size:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
