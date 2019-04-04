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
    
    public var label: String?
    public var placeholder: String?
    public var date: Date?
    public var valueChangedHandler: ((Date?) -> Void)?
    public var heightUpdateHandler: (() -> Void)?
    
    var isEditingDate = false
    
    public init(label: String? = nil, date: Date? = nil, placeholder: String? = nil) {
        self.label = label
        self.date = date
        self.placeholder = placeholder
    }
    
}

extension FormDateField {
    
    func valueChanged() {
        valueChangedHandler?(date)
    }
    
}
