//
//  FormDateField.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 04/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

public class FormDateField: FormField {
    
    public static var cellType: FormFieldCell.Type = FormDateFieldCell.self
    
    public var label: String? {
        didSet {
            fieldUpdatedHandler?()
        }
    }
    
    public var placeholder: String? {
        didSet {
            fieldUpdatedHandler?()
        }
    }
    
    public var date: Date? {
        didSet {
            fieldUpdatedHandler?()
            valueChangedHandler?(date)
        }
    }
    
    public var valueChangedHandler: ((Date?) -> Void)?
    public var heightUpdateHandler: (() -> Void)?
    
    var fieldUpdatedHandler: (() -> Void)?
    
    var isEditingDate = false
    
    public init(label: String? = nil, date: Date? = nil, placeholder: String? = nil) {
        self.label = label
        self.date = date
        self.placeholder = placeholder
    }
    
}
