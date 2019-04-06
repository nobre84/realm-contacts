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
    public var deleteHandler: ((Int) -> Void)?
    
    var count: Int {
        return isShowingEmptyField ? 1 : fields.count
    }
    
    var isShowingEmptyField: Bool {
        return fields.isEmpty && emptyField != nil
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
        return isShowingEmptyField ? emptyField! : fields[index]
    }
    
    func removeField(at index: Int) {
        fields.remove(at: index)
    }
    
}

// Table View Delegate helpers
extension FormSection {
    
    var editingStyle: UITableViewCell.EditingStyle {
        return isEditing && !isShowingEmptyField ? .delete : .none
    }
    
    
}
