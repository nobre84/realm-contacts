//
//  CTError.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 09/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

enum CTError: LocalizedError {
    
    case missingName
    case missingPhoneNumber
    case missingEmail
    
    var errorDescription: String? {
        switch self {
        case .missingName:
            return "A name is required."
        case .missingPhoneNumber:
            return "A phone number is required."
        case .missingEmail:
            return "An e-mail is required."
        }
    }
}
