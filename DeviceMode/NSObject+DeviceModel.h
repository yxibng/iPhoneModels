//
//  NSObject+DeviceModel.h
//  DeviceMode
//
//  Created by yxibng on 2018/12/28.
//  Copyright © 2018 yxibng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DeviceModel)

+ (BOOL)isIPhone_X_Series;
+ (BOOL)isIPhone_X;
+ (BOOL)isIPhone_XR;
+ (BOOL)isIPhone_XS_MAX;

@end

NS_ASSUME_NONNULL_END
