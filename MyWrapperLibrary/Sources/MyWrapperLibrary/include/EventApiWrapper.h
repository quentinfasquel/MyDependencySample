//
//  EventApiWrapper.h
//  
//
//  Created by Quentin Fasquel on 06/10/2020.
//

#import <Foundation/Foundation.h>

@protocol EventListenerProtocol;

NS_SWIFT_NAME(EventAPI)
@interface EventApiWrapper: NSObject
// NOTE: sharedEventApiWrapper will be named `shared` in Swift
@property (class, nonatomic, nonnull, readonly) EventApiWrapper *sharedEventApiWrapper;

- (void)setListener:(nonnull id<EventListenerProtocol>)listener;
- (void)resetListener;
- (void)triggerEvent:(nonnull NSString *)eventName;
@end
