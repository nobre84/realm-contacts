//
//  Phone+FormField.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 07/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

extension DualTextField {
    
    convenience init(_ phone: PhoneNumber) {
        self.init(leftText: phone.label, leftPlaceholder: "label", rightText: phone.number, rightPlaceholder: "number")
    }
    
    convenience init(_ email: Email) {
        self.init(leftText: email.label, leftPlaceholder: "label", rightText: email.email, rightPlaceholder: "e-mail")
    }
    
}
