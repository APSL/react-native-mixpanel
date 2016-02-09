//
//  RNMixpanel.m
//  Dramsclub
//
//  Created by Davide Scalzo on 08/11/2015.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "RNMixpanel.h"
#import "Mixpanel.h"

@implementation RNMixpanel

Mixpanel *mixpanel = nil;

// Expose this module to the React Native bridge
RCT_EXPORT_MODULE(RNMixpanel)

// sharedInstanceWithToken
RCT_EXPORT_METHOD(sharedInstanceWithToken:(NSString *)apiToken) {
    [Mixpanel sharedInstanceWithToken:apiToken];
    mixpanel = [Mixpanel sharedInstance];
}

// track
RCT_EXPORT_METHOD(track:(NSString *)event) {
    [mixpanel track:event];
}

// track with properties
RCT_EXPORT_METHOD(trackWithProperties:(NSString *)event properties:(NSDictionary *)properties) {
    [mixpanel track:event properties:properties];
}

// flush
RCT_EXPORT_METHOD(flush) {
    [mixpanel flush];
}

// create Alias
RCT_EXPORT_METHOD(createAlias:(NSString *)old_id) {
    [mixpanel createAlias:old_id forDistinctID:mixpanel.distinctId];
}

// identify
RCT_EXPORT_METHOD(identify:(NSString *) uniqueId) {
    [mixpanel identify:uniqueId];
}

// Timing Events
RCT_EXPORT_METHOD(timeEvent:(NSString *)event) {
    [mixpanel timeEvent:event];
}

// Register super properties
RCT_EXPORT_METHOD(registerSuperProperties:(NSDictionary *)properties) {
    [mixpanel registerSuperProperties:properties];
}

// Register super properties Once
RCT_EXPORT_METHOD(registerSuperPropertiesOnce:(NSDictionary *)properties) {
    [mixpanel registerSuperPropertiesOnce:properties];
}

// Set People Data
RCT_EXPORT_METHOD(set:(NSString *)key value:(NSString *)value) {
    [mixpanel.people set:@{key: value}];
}

// track Revenue
RCT_EXPORT_METHOD(trackCharge:(nonnull NSNumber *)charge) {
    [mixpanel.people trackCharge:charge];
}

// track with properties
RCT_EXPORT_METHOD(trackChargeWithProperties:(nonnull NSNumber *)charge properties:(NSDictionary *)properties) {
    [mixpanel.people trackCharge:charge withProperties:properties];
}

// increment
RCT_EXPORT_METHOD(increment:(NSString *)property count:(nonnull NSNumber *)count) {
  [mixpanel.people increment:property by:count];
}

// reset
RCT_EXPORT_METHOD(reset) {
    [mixpanel reset];
}

@end
