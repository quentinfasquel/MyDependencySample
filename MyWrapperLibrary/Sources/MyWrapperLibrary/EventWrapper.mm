//
//  EventWrapper
//  
//
//  Created by Quentin Fasquel on 06/10/2020.
//

#import "EventWrapper.h"
#import "EventWrapperInternal.h"

@implementation EventWrapper

- (nonnull instancetype)initWithCppEvent:(cppLibrary::events::Event *)cppEvent {
    if ((self = [super init])) {
        _event = cppEvent;
    }
    return self;
}

- (void)dealloc {
    delete _event;
}

- (nonnull NSString *)name {
    return [NSString stringWithCString:_event->getName().c_str() encoding:NSUTF8StringEncoding];
}

@end
