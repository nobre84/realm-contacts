//
//  Object+Dictionary.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 05/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import RealmSwift

extension Object {
    func toDictionary() -> [String:Any?] {
        let properties = self.objectSchema.properties.map { $0.name }
        var dicProps = [String:Any]()
        for (key, value) in self.dictionaryWithValues(forKeys: properties) {
            if let value = value as? ListBase {
                dicProps[key] = value.toArray()
            } else if let value = value as? Object {
                dicProps[key] = value.toDictionary()
            } else {
                dicProps[key] = value
            }
        }
        return dicProps
    }
}

extension ListBase {
    func toArray() -> [Any] {
        var _toArray = [Any]()
        for i in 0..<self._rlmArray.count {
            let obj = unsafeBitCast(self._rlmArray[i], to: Object.self)
            _toArray.append(obj.toDictionary())
        }
        return _toArray
    }
}