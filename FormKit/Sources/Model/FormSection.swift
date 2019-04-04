//
//  FormSection.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

public class FormSection {
    
    var fields = [FormField]()
    
    public init(label: String? = nil, fields: [FormField] = []) {
        self.fields = fields
    }
    
}
