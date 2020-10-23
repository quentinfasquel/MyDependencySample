//
//  EventWrapper.h
//  
//
//  Created by Quentin Fasquel on 06/10/2020.
//

#import "EventProtocol.h"

NS_SWIFT_NAME(Event)
@interface EventWrapper : NSObject <EventProtocol>
@property (nonatomic, nonnull, readonly) NSString *name;
@end
