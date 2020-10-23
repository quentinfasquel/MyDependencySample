//
//  Event.hpp
//  MyCppLibrary
//
//  Created by Quentin Fasquel on 06/10/2020.
//

#ifndef Event_hpp
#define Event_hpp
#ifdef __cplusplus

#include <stdio.h>
#include <string>

namespace cppLibrary {
  namespace events {

    class Event {
    public:
        
        Event(const std::string & name) : _name(name) {};
        ~Event() {};
        
        inline const std::string & getName() { return _name; }
        
    private:
        std::string _name;
    };

  }
}

#endif
#endif /* Event_hpp */
