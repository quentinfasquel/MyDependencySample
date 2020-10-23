//
//  EventWrapperInternal.h
//  
//
//  Created by Quentin Fasquel on 06/10/2020.
//

#import "EventWrapper.h"

#include "Event.hpp"

@interface EventWrapper () {
    cppLibrary::events::Event *_event;
}

- (nonnull instancetype)initWithCppEvent:(cppLibrary::events::Event *_Nonnull)cppEvent;

@end
