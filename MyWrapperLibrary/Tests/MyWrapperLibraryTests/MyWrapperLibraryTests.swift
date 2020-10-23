import XCTest
@testable import MyWrapperLibrary

final class MyWrapperLibraryTests: XCTestCase {

    let sut: EventAPI = .shared
    
    func testSetListener() {
        weak var weakListener: EventListenerProtocol!
        var listener: EventListenerProtocol! = EventListenerMock { _ in
            // On receive
        }

        XCTAssertNil(weakListener)

        // Assert that sut.setListener() keeps a strong reference
        sut.setListener(listener)
        weakListener = listener
        listener = nil
        XCTAssertNotNil(weakListener)

        // Assert that sut.resetListener() released the strong reference
        sut.resetListener()
        XCTAssertNil(weakListener)
    }
    
    func testTriggerEvent() {
        let eventReceived = expectation(description: "onReceived was called")
        let eventName = "TEST_EVENT"

        sut.setListener(EventListenerMock { event in
            eventReceived.fulfill()
            XCTAssertEqual(event.name, eventName)
        })
        
        sut.triggerEvent(eventName)

        waitForExpectations(timeout: 1.0)
    }

    static var allTests = [
        ("testSetListener", testSetListener),
    ]
}
