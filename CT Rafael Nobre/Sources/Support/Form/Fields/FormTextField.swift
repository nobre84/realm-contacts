//
//  FormTextField.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

class FormTextField: FormField {
    
    static var cellType: FormFieldCell.Type = FormTextFieldCell.self

    var label: String?
    var text: String?
    var placeholder: String?
    var valueChangedHandler: ((String?) -> Void)?
    
    init(label: String?, text: String?, placeholder: String?) {
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
