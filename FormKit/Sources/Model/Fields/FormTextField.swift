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

    public var label: String? {
        didSet {
            fieldUpdatedHandler?()
        }
    }
    
    public var text: String? {
        didSet {
            fieldUpdatedHandler?()
            textChangedHandler?(text)
        }
    }
    
    public var placeholder: String? {
        didSet {
            fieldUpdatedHandler?()
        }
    }
    
    public var inputTraits: FormInputTraits? {
        didSet {
            fieldUpdatedHandler?()
        }
    }
    
    public var textChangedHandler: ((String?) -> Void)?
    public var heightUpdateHandler: (() -> Void)?
    
    var fieldUpdatedHandler: (() -> Void)?
    
    public init(label: String? = nil, text: String? = nil, placeholder: String? = nil) {
        self.label = label
        self.text = text
        self.placeholder = placeholder
    }
}
