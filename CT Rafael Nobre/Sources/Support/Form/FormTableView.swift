//
//  FormTableView.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

class FormTableView: TPKeyboardAvoidingTableView {

    var sections = [FormSection]() {
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        registerCells()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func registerCell(_ customCell: FormFieldCell.Type) {
        register(customCell.nib, forCellReuseIdentifier: customCell.identifier)
    }
    
    private func registerCells() {
        register(FormLabelFieldCell.self)
        register(FormTextFieldCell.self)
    }
    
}

extension FormTableView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].fields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = sections[indexPath.section].fields[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: field).cellType.identifier, for: indexPath)
        
        if let formCell = cell as? FormFieldCell {
            formCell.setup(with: field)
        }
        
        return cell
    }
    
}

extension FormTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let field = sections[indexPath.section].fields[indexPath.row]
        
        if let formCell = cell as? FormFieldCell {
            formCell.setup(with: field)
            formCell.updateUI()
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let formCell = cell as? FormFieldCell {
            formCell.setup(with: nil)
        }
    }
    
}
