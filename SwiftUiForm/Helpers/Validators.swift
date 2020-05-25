//
//  Validators.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 31.03.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import Foundation


class Validators {
    
    static func isFilled (firstName: String?, mail: String?, pass: String?) -> Bool {
        guard !(firstName ?? "").isEmpty,
            !(mail ?? "").isEmpty,
            !(pass ?? "").isEmpty else{
                return false
        }
        return true
    }
    
    static func isSimpleEmail (_ mail: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check (text: mail, regEx: emailRegEx)
    }
    
    static func check (text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}
