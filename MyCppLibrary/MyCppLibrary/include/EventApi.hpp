//
//  Api.h
//  MyCppLibrary
//
//  Created by Quentin Fasquel on 06/10/2020.
//

#ifndef Api_h
#define Api_h
#ifdef __cplusplus

#include "EventListener.hpp"

namespace cppLibrary {

class EventApi {
    static EventApi *instance;

    EventApi() : _listener(NULL) {}
    
public:

    static EventApi *get() {
        if (!instance) {
            instance = new EventApi();
        }
        return instance;
    }
    
    void setListener(cppLibrary::events::EventListener *listener);
    void resetListener();
    
    void triggerEventName(const std::string eventName);
    
private:
    
    cppLibrary::events::EventListener *_listener;
};

}

#endif
#endif /* Api_h */
