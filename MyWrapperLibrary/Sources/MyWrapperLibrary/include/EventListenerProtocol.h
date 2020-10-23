//
//  EventListenerProtocol.h
//  
//
//  Created by Quentin Fasquel on 06/10/2020.
//

#import <Foundation/Foundation.h>

@protocol EventProtocol;

@protocol EventListenerProtocol
- (void)onReceived:(nonnull id<EventProtocol>)event;
@end
