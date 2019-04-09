//
//  FormInputTraits.swift
//  FormKit
//
//  Created by Rafael Nobre on 08/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

public struct FormInputTraits {
    
    public var autocapitalizationType: UITextAutocapitalizationType?
    public var autocorrectionType: UITextAutocorrectionType?
    public var spellCheckingType: UITextSpellCheckingType?
    public var keyboardType: UIKeyboardType?
    public var keyboardAppearance: UIKeyboardAppearance?
    public var returnKeyType: UIReturnKeyType?
    public var isSecureTextEntry: Bool?
    
    public init(autocapitalizationType: UITextAutocapitalizationType? = nil, autocorrectionType: UITextAutocorrectionType? = nil, spellCheckingType: UITextSpellCheckingType? = nil, keyboardType: UIKeyboardType? = nil, keyboardAppearance: UIKeyboardAppearance? = nil, returnKeyType: UIReturnKeyType? = nil, isSecureTextEntry: Bool? = nil) {
        self.autocapitalizationType = autocapitalizationType
        self.autocorrectionType = autocorrectionType
        self.spellCheckingType = spellCheckingType
        self.keyboardType = keyboardType
        self.keyboardAppearance = keyboardAppearance
        self.returnKeyType = returnKeyType
        self.isSecureTextEntry = isSecureTextEntry
    }
}

extension UITextField {
    
    public func setTraits(_ traits: FormInputTraits?) {
        guard let traits = traits else { return }
        
        autocapitalizationType = traits.autocapitalizationType ?? .sentences
        autocorrectionType = traits.autocorrectionType ?? .default
        spellCheckingType = traits.spellCheckingType ?? .default
        keyboardType = traits.keyboardType ?? .default
        keyboardAppearance = traits.keyboardAppearance ?? .default
        returnKeyType = traits.returnKeyType ?? .default
        isSecureTextEntry = traits.isSecureTextEntry ?? false
    }
    
}
