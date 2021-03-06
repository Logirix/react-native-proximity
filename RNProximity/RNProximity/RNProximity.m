//
//  RNProximity.m
//
//  Created by William Bout
//

#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>
#import "RNProximity.h"

@implementation RNProximity

@synthesize bridge = _bridge;

- (instancetype)init
{
    if ((self = [super init])) {
        [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sensorStateChange:) name:@"UIDeviceProximityStateDidChangeNotification" object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)sensorStateChange:(NSNotificationCenter *)notification
{
    BOOL proximityState = [[UIDevice currentDevice] proximityState];
    [_bridge.eventDispatcher sendDeviceEventWithName:@"proximityStateDidChange"
                                                body:@{@"proximity": @(proximityState)}];
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(proximityEnabled:(BOOL)enabled) {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIDevice currentDevice] setProximityMonitoringEnabled:enabled];
    });
}

RCT_EXPORT_METHOD(hasProximitySensor: (RCTPromiseResolveBlock) resolve
            rejecter:
            (RCTPromiseRejectBlock) reject) {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIDevice *device = [UIDevice currentDevice];
        [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
        BOOL exists = device.proximityMonitoringEnabled;
        [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
        resolve(@(exists));
    });
}

@end
