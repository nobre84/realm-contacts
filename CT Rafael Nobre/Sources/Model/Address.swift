//
//  Address.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 25/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import RealmSwift

class Address: Object {
    var label: String?
    var street: String?
    var number: String?
    var city: String?
    var state: String?
    var country: String?
    var zipCode: String?
}
