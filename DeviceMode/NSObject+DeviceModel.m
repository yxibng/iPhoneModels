//
//  NSObject+DeviceModel.m
//  DeviceMode
//
//  Created by yxibng on 2018/12/28.
//  Copyright © 2018 yxibng. All rights reserved.
//

#import "NSObject+DeviceModel.h"
#import <sys/sysctl.h>
#import <sys/utsname.h>

@implementation NSObject (DeviceModel)

+ (void)load
{
    NSString *model = [self deviceModel];
    NSLog(@"device model = %@",model);
    NSLog(@"is_X_Series = %@",@([self isIPhone_X_Series]));
    
}


+ (BOOL)isIPhone_X_Series
{
    static BOOL is_X_Series = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        is_X_Series = ([self isIPhone_X] || [self isIPhone_XR] || [self isIPhone_XS_MAX]);
    });
    return is_X_Series;
}

+ (BOOL)isIPhone_X
{
    static BOOL is_X_ = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *iPhone_X_Models = @[@"iPhone10,3",
                                     @"iPhone10,6"];
        NSArray *iPhone_XS_Models = @[@"iPhone11,2"];
        NSString *currentModel = [self deviceModel];
        is_X_ = ([iPhone_X_Models containsObject:currentModel] || [iPhone_XS_Models containsObject:currentModel]);
    });
    return is_X_;
    
    
}

+ (BOOL)isIPhone_XR
{
    static BOOL is_XR = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *iPhone_XR_Models = @[@"iPhone11,8"];
        NSString *currentModel = [self deviceModel];
        is_XR = [iPhone_XR_Models containsObject:currentModel];
    });
    return is_XR;
}


+ (BOOL)isIPhone_XS_MAX
{
    static BOOL is_XS_MAX = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *iPhone_XS_MAX_Models = @[@"iPhone11,6",@"iPhone11,4"];
        NSString *currentModel = [self deviceModel];
        is_XS_MAX =  [iPhone_XS_MAX_Models containsObject:currentModel];
    });
    return is_XS_MAX;
}

+ (NSString *)deviceModel
{
#if TARGET_IPHONE_SIMULATOR
    // 获取模拟器所对应的 device model
    NSString *model = NSProcessInfo.processInfo.environment[@"SIMULATOR_MODEL_IDENTIFIER"];
#else
    // 获取真机设备的 device model
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *model = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
#endif
    return model;
}

@end
