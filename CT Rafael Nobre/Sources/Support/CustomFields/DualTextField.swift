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
    
    var leftText: String? {
        didSet {
            fieldUpdatedHandler?()
            textChangedHandler?(leftText, rightText)
        }
    }
    
    var leftPlaceholder: String? {
        didSet {
            fieldUpdatedHandler?()
        }
    }
    
    var leftInputTraits: FormInputTraits? {
        didSet {
            fieldUpdatedHandler?()
        }
    }
    
    var rightText: String? {
        didSet {
            fieldUpdatedHandler?()
            textChangedHandler?(leftText, rightText)
        }
    }
    
    var rightPlaceholder: String? {
        didSet {
            fieldUpdatedHandler?()
        }
    }
    
    var rightInputTraits: FormInputTraits? {
        didSet {
            fieldUpdatedHandler?()
        }
    }
    
    var textChangedHandler: ((String?, String?) -> Void)?
    var heightUpdateHandler: (() -> Void)?
    var fieldUpdatedHandler: (() -> Void)?
    
    public init(leftText: String? = nil, leftPlaceholder: String? = nil, rightText: String? = nil, rightPlaceholder: String? = nil) {
        self.leftText = leftText
        self.leftPlaceholder = leftPlaceholder
        self.rightText = rightText
        self.rightPlaceholder = rightPlaceholder
    }
    
}

extension DualTextField {
    
    func valueChanged() {
        textChangedHandler?(leftText, rightText)
    }
    
}
