//
//  FormSection.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

public class FormSection {
    
    var title: String?
    var fields = [FormField]()
    var button: FormButton?
    
    public init(title: String? = nil, fields: [FormField] = [], button: FormButton? = nil) {
        self.title = title
        self.fields = fields
        self.button = button
    }
    
}
