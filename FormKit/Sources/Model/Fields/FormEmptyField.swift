//
//  FormEmptyField.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

public class FormEmptyField: FormField {

    public var text: String? {
        didSet {
            fieldUpdatedHandler?()
        }
    }
    
    public var heightUpdateHandler: (() -> Void)?
    
    public static var cellType: FormFieldCell.Type = FormEmptyFieldCell.self
    
    var fieldUpdatedHandler: (() -> Void)?
    
    public init(text: String? = nil) {
        self.text = text
    }
}
