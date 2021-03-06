//
//  ServerNameValidator.swift
//  Boost
//
//  Created by Ondrej Rafaj on 12/04/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Base


class ServerNameValidator: Validator {
    
    var maxCharacterCount: UInt = 25
    
    func validate(_ value: String) -> Bool {
        return value.count <= maxCharacterCount
    }
    
    var invalidMessage: String = Lang.get("validation.field.invalid-server-name")
    
}
