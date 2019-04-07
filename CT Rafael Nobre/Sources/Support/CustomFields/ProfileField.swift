//
//  ProfileField.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 07/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import FormKit

class ProfileField: FormField {

    static var cellType: FormFieldCell.Type = ProfileFieldCell.self
    
    weak var presenter: UIViewController?
    var picture: UIImage?
    var valueChangedHandler: ((Data?) -> Void)?
    var heightUpdateHandler: (() -> Void)?
    
    public init(_ imageData: Data? = nil, presenter: UIViewController?) {
        if let imageData = imageData {
            self.picture = UIImage(data: imageData)
        }
        self.presenter = presenter
    }
    
}
