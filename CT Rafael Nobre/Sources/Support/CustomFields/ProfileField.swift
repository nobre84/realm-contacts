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
    
    weak var presentationContext: UIViewController?
    var picture: UIImage?
    var valueChangedHandler: ((Data?) -> Void)?
    var heightUpdateHandler: (() -> Void)?
    
    public init(_ imageData: Data? = nil, presentationContext: UIViewController?) {
        if let imageData = imageData {
            self.picture = UIImage(data: imageData)
        }
        self.presentationContext = presentationContext
    }
    
}
