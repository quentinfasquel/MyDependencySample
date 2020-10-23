//
//  CppApi.cpp
//  MyCppLibrary
//
//  Created by Quentin Fasquel on 06/10/2020.
//

#include "EventApi.hpp"

using namespace cppLibrary;
using namespace cppLibrary::events;

EventApi *EventApi::instance = nullptr;

void EventApi::setListener(EventListener *listener) {
    _listener = listener;
}

void EventApi::resetListener() {
    if (_listener != nullptr) {
        delete _listener; _listener = nullptr;
    }
}

void EventApi::triggerEventName(const std::string eventName) {
    if (_listener != NULL) {
        Event *event = new Event(eventName);
        _listener->onEventReceived(event);
    }
}
