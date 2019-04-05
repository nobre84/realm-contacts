//
//  Contact.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 25/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import RealmSwift

/*
 - first name
 - last name
 - date of birth
 - zero or more addresses
 - one or more phone numbers
 - one or more emails
 */

class Contact: Object {
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var birthday: Date?
    var addresses = List<Address>()
    var phoneNumbers = List<PhoneNumber>()
    var emails = List<Email>()
}

extension Contact {
    var fullName: String? {
        return [firstName, lastName].compactMap { $0 }.filter { !$0.isEmpty }.joined(separator: " ")
    }
}

