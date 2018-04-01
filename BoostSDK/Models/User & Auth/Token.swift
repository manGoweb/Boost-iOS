//
//  Token.swift
//  BoostSDK
//
//  Created by Ondrej Rafaj on 01/04/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


public struct Token: Codable {
    
    struct Request: Codable {
        let token: String
    }
    
    public let id: String
    public let expires: String
    public let user: User
    
    enum CodingKeys: String, CodingKey {
        case expires
        case id
        case user
    }
}
