//
//  File.m
//  
//
//  Created by Quentin Fasquel on 06/10/2020.
//

#import "EventApiWrapper.h"

#include "EventApi.hpp"
#include "EventListener.hpp"
#include "InternalEventListener.h"

@interface EventApiWrapper () {
    cppLibrary::EventApi *_api;
}
@end

@implementation EventApiWrapper

+ (nonnull EventApiWrapper *)sharedEventApiWrapper {
    static EventApiWrapper *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EventApiWrapper new];
    });
    return sharedInstance;
}

- (nonnull instancetype)init {
    if ((self = [super init])) {
        _api = cppLibrary::EventApi::get();
    }
    return self;
}

- (void)setListener:(nonnull id<EventListenerProtocol>)listener {
    auto cppListener = new InternalEventListener(listener);
    _api->setListener(static_cast<cppLibrary::events::EventListener *>(cppListener));
}

- (void)resetListener {
    _api->resetListener();
}

- (void)triggerEvent:(nonnull NSString *)eventName {
    _api->triggerEventName(eventName.UTF8String);
}

@end
