//
//  ViewController.swift
//  MyDependencySample
//
//  Created by Quentin Fasquel on 06/10/2020.
//

import UIKit
import MyWrapperLibrary

import os.log

class ViewController: UIViewController, EventListenerProtocol {

    let api = EventAPI.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        api.setListener(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.async {
            self.api.triggerEvent("main event")
        }
    }
    
    func onReceived(_ event: EventProtocol) {
        os_log(.debug, "onReceived event '%s'", event.name)

        // When resetListener is called, `InternalEventListener` gets released
        api.resetListener()
    }
}

