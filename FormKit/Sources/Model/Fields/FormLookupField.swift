//
//  FormLookupField.swift
//  FormKit
//
//  Created by Rafael Nobre on 08/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

public protocol FormLookupFieldValue {
    var text: String? { get }
}

public class FormLookupField: FormField {
    
    public var label: String?
    public var value: FormLookupFieldValue?
    public var heightUpdateHandler: (() -> Void)?
    public var tappedHandler: (() -> Void)?
    public var valueChangedHandler: ((FormLookupFieldValue?) -> Void)?
    
    public static var cellType: FormFieldCell.Type = FormLookupFieldCell.self
    
    public init(label: String? = nil, value: FormLookupFieldValue? = nil) {
        self.label = label
        self.value = value
    }
}

extension FormLookupField {
    func tapped() {
        tappedHandler?()
    }
}
