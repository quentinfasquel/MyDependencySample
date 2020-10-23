//
//  InternalEventListener.hpp
//  
//
//  Created by Quentin Fasquel on 06/10/2020.
//

#ifndef InternalEventListener_hpp
#define InternalEventListener_hpp

#include "EventListener.hpp"

@protocol EventListenerProtocol;

class InternalEventListener : public cppLibrary::events::EventListener {
public:
    InternalEventListener(id<EventListenerProtocol> listener);
    ~InternalEventListener();
    
    void onEventReceived(cppLibrary::events::Event *event);
    
private:
    id<EventListenerProtocol> _listener;
};


#endif /* InternalEventListener_hpp */
