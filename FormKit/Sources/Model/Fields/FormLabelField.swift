//
//  FormLabelField.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

public class FormLabelField: FormField {

    public var label: String? {
        didSet {
            fieldUpdatedHandler?()
        }
    }
    
    public var value: String? {
        didSet {
            fieldUpdatedHandler?()
        }
    }
    
    public static var cellType: FormFieldCell.Type = FormLabelFieldCell.self
    public var heightUpdateHandler: (() -> Void)?
    
    var fieldUpdatedHandler: (() -> Void)?
    
    public init(label: String? = nil, value: String? = nil) {
        self.label = label
        self.value = value
    }
}
