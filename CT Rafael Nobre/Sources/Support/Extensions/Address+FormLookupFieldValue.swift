//
//  Address+FormLookupFieldValue.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 08/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import FormKit

extension Address: FormLookupFieldValue {
    
    var text: String? {
        let components = [ street, number, city, state, country, zipCode ].compactMap { $0 }
        return components.joined(separator: ", ")
    }
    
}
