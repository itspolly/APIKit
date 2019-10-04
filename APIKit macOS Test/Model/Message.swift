//
//  Message.swift
//  APIKit macOS Test
//
//  Created by Jamie Bishop on 27/09/2019.
//  Copyright © 2019 Jamie Bishop. All rights reserved.
//

import Foundation

struct Message: Decodable {
    let id: String
    let text: String
    let userId: String
}
