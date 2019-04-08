//
//  FormLookupField+Address.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 08/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import FormKit

extension FormLookupField {
    
    convenience init(_ address: Address) {
        self.init(label: address.label, value: address)
    }
    
}
