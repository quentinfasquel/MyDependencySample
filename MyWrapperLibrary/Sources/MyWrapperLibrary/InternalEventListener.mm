//
//  InternalEventListener.cpp
//  
//
//  Created by Quentin Fasquel on 06/10/2020.
//

#import "InternalEventListener.h"

#import "EventListenerProtocol.h"
#import "EventWrapperInternal.h"

InternalEventListener::InternalEventListener(id<EventListenerProtocol> listener) : _listener(listener) {
}

InternalEventListener::~InternalEventListener() {
}

void InternalEventListener::onEventReceived(cppLibrary::events::Event *event) {
    if (_listener != nil) {
        [_listener onReceived:
         [[EventWrapper alloc] initWithCppEvent:event]];
    }
}
