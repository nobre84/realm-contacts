//
//  FormTextField.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

public class FormTextField: FormField {
    
    public static var cellType: FormFieldCell.Type = FormTextFieldCell.self

    public var label: String?
    public var text: String?
    public var placeholder: String?
    public var inputTraits: FormInputTraits?
    public var valueChangedHandler: ((String?) -> Void)?
    public var heightUpdateHandler: (() -> Void)?
    
    public init(label: String? = nil, text: String? = nil, placeholder: String? = nil) {
        self.label = label
        self.text = text
        self.placeholder = placeholder
    }
    
}

extension FormTextField {
    
    func valueChanged() {
        valueChangedHandler?(text)
    }
    
}
