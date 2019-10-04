//
//  JSONAPIRequest.swift
//  APIKit
//
//  Created by Jamie Bishop on 27/09/2019.
//  Copyright © 2019 Jamie Bishop. All rights reserved.
//

import Foundation

public protocol JSONAPIRequest: APIRequest, Encodable { }

extension JSONAPIRequest {
    var body: RequestBody? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return RequestBody(data: data, contentType: "application/json")
    }
}
