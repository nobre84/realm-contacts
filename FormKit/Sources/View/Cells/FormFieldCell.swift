//
//  FormFieldCell.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 01/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

public protocol FormFieldCell where Self: UITableViewCell {
    static var identifier: String { get }
    static var nib: UINib { get }
    func setup(with field: FormField?)
    func updateUI()
}

extension FormFieldCell {
    static var identifier: String { return self.defaultReuseIdentifier }
}

extension FormFieldCell where Self: NibLoadableView {
    static var nib: UINib { return UINib(nibName: self.nibName, bundle: Bundle(for: self)) }
}
