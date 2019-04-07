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
    public var isHidden = false
    public var isHeaderHidden: Bool
    public var isFooterHidden: Bool
    
    var title: String?
    var footerText: String?
    var button: FormButton?
    var emptyField: FormField?
    var insertHandler: ((Int, Bool) -> Void)?
    
    var count: Int {
        return isShowingEmptyField ? 1 : fields.count
    }
    
    var isShowingEmptyField: Bool {
        return fields.isEmpty && emptyField != nil
    }
    
    private var fields = [FormField]()
    
    public init(title: String? = nil, footerText: String? = nil, fields: [FormField] = [], button: FormButton? = nil, isEditing: Bool = false, emptyField: FormField? = nil) {
        self.title = title
        self.footerText = footerText
        isFooterHidden = footerText == nil
        isHeaderHidden = false
        self.fields = fields
        self.button = button
        self.isEditing = isEditing
        self.emptyField = emptyField
    }
    
    public subscript(index: Int) -> FormField {
        return isShowingEmptyField ? emptyField! : fields[index]
    }
    
    public func remove(at index: Int) {
        fields.remove(at: index)
        deleteHandler?(index)
    }
    
    public func append(_ field: FormField) {
        let hadEmptyField = isShowingEmptyField
        fields.append(field)
        insertHandler?(fields.count - 1, hadEmptyField)
    }
    
}

// Table View Delegate helpers
extension FormSection {
    
    var editingStyle: UITableViewCell.EditingStyle {
        return isEditing && !isShowingEmptyField ? .delete : .none
    }
    
    
}
