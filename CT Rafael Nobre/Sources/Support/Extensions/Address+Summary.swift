//
//  Address+Summary.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 07/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

extension Address {
    
    var summary: String {
        return (street ?? "") + (number ?? "")
    }

}
