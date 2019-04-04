//
//  FormLabelField.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

public class FormLabelField: FormField {

    public var label: String?
    public var value: String?
    public var heightUpdateHandler: (() -> Void)?
    
    public static var cellType: FormFieldCell.Type = FormLabelFieldCell.self
    
    public init(label: String? = nil, value: String? = nil) {
        self.label = label
        self.value = value
    }
}
