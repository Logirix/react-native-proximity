
#import "RNProximity.h"

@implementation RNProximity
@synthesize bridge = _bridge;

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

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

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(proximityEnabled:(BOOL)enabled) {
  [[UIDevice currentDevice] setProximityMonitoringEnabled:enabled];
}

@end
