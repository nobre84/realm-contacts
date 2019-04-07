//
//  DualTextField.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 07/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import FormKit

class DualTextField: FormField {
    
    static var cellType: FormFieldCell.Type = DualTextFieldCell.self
    
    var leftText: String?
    var leftPlaceholder: String?
    var rightText: String?
    var rightPlaceholder: String?
    
    var valueChangedHandler: ((String?, String?) -> Void)?
    var heightUpdateHandler: (() -> Void)?
    
    public init(leftText: String? = nil, leftPlaceholder: String? = nil, rightText: String? = nil, rightPlaceholder: String? = nil) {
        self.leftText = leftText
        self.leftPlaceholder = leftPlaceholder
        self.rightText = rightText
        self.rightPlaceholder = rightPlaceholder
    }
    
}

extension DualTextField {
    
    func valueChanged() {
        valueChangedHandler?(leftText, rightText)
    }
    
}
