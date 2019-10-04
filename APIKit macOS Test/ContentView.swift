//
//  ContentView.swift
//  APIKit macOS Test
//
//  Created by Jamie Bishop on 27/09/2019.
//  Copyright © 2019 Jamie Bishop. All rights reserved.
//

import Cocoa
import APIKit

class ContentView: NSView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        print("initing")
        testAPIKit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func testAPIKit() {
        let client = APIClient(baseURL: URL(string: "http://127.0.0.1:3000")!)
        client.send(request: GetMessagesRequest()) { result in
            switch result {
            case .success(let messages): dump(messages)
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
}
