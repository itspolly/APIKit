//
//  RequestBody.swift
//  APIKit
//
//  Created by Jamie Bishop on 27/09/2019.
//  Copyright © 2019 Jamie Bishop. All rights reserved.
//

import Foundation

public struct RequestBody {
    /// The raw data that this body represents
    let data: Data
    
    /// The content type header for this body
    let contentType: String
}
