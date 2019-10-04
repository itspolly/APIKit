//
//  APIClient.swift
//  APIKit
//
//  Created by Jamie Bishop on 27/09/2019.
//  Copyright © 2019 Jamie Bishop. All rights reserved.
//

import Foundation

public class APIClient {
    private let baseURL: URL
    private let session = URLSession(configuration: .default)
    
    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    // MARK: - Public API
    
    public func send<T: APIRequest>(request: T, completion: @escaping ResultCallback<T.Response>) {
        let endpoint = getEndpoint(for: request)
        
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = request.method.rawValue
        
        if let body = request.body {
            urlRequest.httpBody = body.data
            urlRequest.setValue(body.contentType, forHTTPHeaderField: "Content-Type")
        }
        
        session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else { return completion(.failure(error!)) }
            do {
                let decoder = JSONDecoder()
                
                // FIXME: - Make configurable
                if #available(OSX 10.12, *) {
                    decoder.dateDecodingStrategy = .iso8601
                }
                
                let response = try decoder.decode(T.Response.self, from: data)
                return completion(.success(response))
            } catch let error {
                print("Error decoding JSON: \(error)")
                return completion(.failure(error))
            }
        }.resume()
    }

    // MARK: - Private API
    
    private func getEndpoint<T: APIRequest>(for request: T) -> URL {
           guard let base = URL(string: request.endpoint, relativeTo: baseURL) else { fatalError("[APIKit] Failed to compose URL: \(request.endpoint) is not a valid endpoint.") }
           
           var components = URLComponents(url: base, resolvingAgainstBaseURL: true)!
           components.queryItems = request.queryParameters
           
           print(components.url!.absoluteString)
           return components.url!
       }
}
