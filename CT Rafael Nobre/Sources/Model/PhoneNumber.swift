//
//  PhoneNumber.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 25/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import RealmSwift

class PhoneNumber: Object {
    @objc dynamic var label: String?
    @objc dynamic var number: String?
}
