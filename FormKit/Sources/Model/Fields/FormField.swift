//
//  FormField.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

public protocol FormField {
    static var cellType: FormFieldCell.Type { get }
    var heightUpdateHandler: (() -> Void)? { get set }
}
