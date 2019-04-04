//
//  FormLabelFieldCell.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

class FormLabelFieldCell: UITableViewCell, FormFieldCell, NibLoadableView {
   
    weak var field: FormLabelField?
    
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var labelLabel: UILabel!
    
    func setup(with field: FormField?) {
        self.field = field as? FormLabelField
    }
    
    func updateUI() {
        labelLabel.text = field?.label
        valueLabel.text = field?.value
    }
    
}
