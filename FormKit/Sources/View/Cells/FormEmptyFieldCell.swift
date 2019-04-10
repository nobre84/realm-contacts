//
//  FormEmptyFieldCell.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

class FormEmptyFieldCell: UITableViewCell, FormFieldCell, NibLoadableView {
   
    weak var field: FormEmptyField?
    
    @IBOutlet private weak var emptyLabel: UILabel!
    
    func setup(with field: FormField?) {
        self.field = field as? FormEmptyField
        self.field?.fieldUpdatedHandler = { [weak self] in
            self?.updateUI()
        }
    }
    
    func updateUI() {
        emptyLabel.text = field?.text ?? ""
    }
    
}
