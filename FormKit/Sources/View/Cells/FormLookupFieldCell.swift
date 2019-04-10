//
//  FormLookupFieldCell.swift
//  FormKit
//
//  Created by Rafael Nobre on 08/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

class FormLookupFieldCell: UITableViewCell, FormFieldCell, NibLoadableView {
    
    weak var field: FormLookupField?
    
    @IBOutlet private weak var labelLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        contentView.addGestureRecognizer(tapRecognizer)
    }
    
    func setup(with field: FormField?) {
        self.field = field as? FormLookupField
        self.field?.fieldUpdatedHandler = { [weak self] in
            self?.updateUI()
        }
    }
    
    func updateUI() {
        labelLabel.text = field?.label ?? ""
        valueLabel.text = field?.value?.text ?? ""
    }
    
    @objc private func cellTapped() {
        guard let field = field else { return }
        
        field.tapped()
    }
}

