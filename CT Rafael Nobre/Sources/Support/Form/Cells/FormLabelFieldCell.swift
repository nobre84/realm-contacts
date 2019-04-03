//
//  FormLabelFieldCell.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

class FormLabelFieldCell: UITableViewCell, FormFieldCell {
   
    weak var field: FormLabelField?
    static var nib: UINib { return UINib(resource: R.nib.formLabelFieldCell) }
    static var identifier: String { return R.reuseIdentifier.formLabelFieldCell.identifier }
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var labelLabel: UILabel!
    
    func setup(with field: FormField?) {
        self.field = field as? FormLabelField
    }
    
    func updateUI() {
        labelLabel.text = field?.label
        valueLabel.text = field?.value
    }
    
}
