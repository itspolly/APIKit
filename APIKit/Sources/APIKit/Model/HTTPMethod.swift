//
//  HTTPMethod.swift
//  APIKit
//
//  Created by Jamie Bishop on 27/09/2019.
//  Copyright © 2019 Jamie Bishop. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    case head = "HEAD"
    case options = "OPTIONS"
    case trace = "TRACE"
    case connect = "CONNECT"
}
