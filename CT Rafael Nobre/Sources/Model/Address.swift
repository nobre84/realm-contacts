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
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var label: String?
    @objc dynamic var street: String?
    @objc dynamic var number: String?
    @objc dynamic var city: String?
    @objc dynamic var state: String?
    @objc dynamic var country: String?
    @objc dynamic var zipCode: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    var isEmpty: Bool {
        var dict = toDictionary()
        dict["id"] = nil
        return dict.isEmpty
    }
}
