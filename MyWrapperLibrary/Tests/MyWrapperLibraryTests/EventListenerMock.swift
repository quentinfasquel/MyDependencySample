//
//  EventListenerMock.swift
//  
//
//  Created by Quentin Fasquel on 06/10/2020.
//

import MyWrapperLibrary

final class EventListenerMock: EventListenerProtocol {
    
    let onReceivedHandler: (EventProtocol) -> Void
    
    init(_ handler: @escaping (EventProtocol) -> Void) {
        onReceivedHandler = handler
    }

    func onReceived(_ event: EventProtocol) {
        onReceivedHandler(event)
    }
}
