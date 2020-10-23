//
//  EventListener.hpp
//  MyCppLibrary
//
//  Created by Quentin Fasquel on 06/10/2020.
//

#ifndef EventListener_hpp
#define EventListener_hpp
#ifdef __cplusplus

#include "Event.hpp"

namespace cppLibrary {
  namespace events {

    class EventListener {
    public:
        virtual ~EventListener();
        virtual void onEventReceived(Event *event);
        
    protected:
        EventListener() {};
    };

  }
}

#endif
#endif /* EventListener_hpp */
