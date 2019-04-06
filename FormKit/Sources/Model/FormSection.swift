//
//  FormSection.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

public class FormSection {
    
    public var isEditing: Bool
    
    var count: Int {
        if fields.isEmpty && emptyField != nil {
            return 1
        }
        return fields.count
    }
    
    var title: String?
    var button: FormButton?
    var emptyField: FormField?
    
    private var fields = [FormField]()
    
    public init(title: String? = nil, fields: [FormField] = [], button: FormButton? = nil, isEditing: Bool = false, emptyField: FormField? = nil) {
        self.title = title
        self.fields = fields
        self.button = button
        self.isEditing = isEditing
        self.emptyField = emptyField
    }
    
    subscript(index: Int) -> FormField {
        if fields.isEmpty {
            return emptyField!
        }
        return fields[index]
    }
    
}

// Table View Delegate helpers
extension FormSection {
    
    var editingStyle: UITableViewCell.EditingStyle {
        return isEditing && !(emptyField != nil) ? .delete : .none
    }
    
    
}
