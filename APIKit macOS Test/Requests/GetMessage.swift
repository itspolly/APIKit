//
//  GetMessage.swift
//  APIKit macOS Test
//
//  Created by Jamie Bishop on 27/09/2019.
//  Copyright © 2019 Jamie Bishop. All rights reserved.
//

import Foundation
import APIKit

struct GetMessageRequest: APIRequest {
    typealias Response = Message
    
    var endpoint: String
    var queryParameters: [URLQueryItem] = []
    
    init(id: String) {
        endpoint = "/messages/\(id)"
    }
}
