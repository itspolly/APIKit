//
//  APIRequest.swift
//  APIKit
//
//  Created by Jamie Bishop on 27/09/2019.
//  Copyright © 2019 Jamie Bishop. All rights reserved.
//

import Foundation

public protocol APIRequest {
    associatedtype Response: Decodable
       
    var endpoint: String { get }
    var method: HTTPMethod  { get }
    var queryParameters: [URLQueryItem] { get set }
   
    var body: RequestBody? { get }
}

extension APIRequest {
    public var method: HTTPMethod {
        return .get
    }
    
    var queryParameters: [URLQueryItem] {
        return []
    }
    
    public var body: RequestBody? {
        return nil
    }
}

