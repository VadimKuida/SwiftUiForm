//
//  UserLogin.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 25.05.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import Foundation


struct logInUser {
    var userLogin: String
    
    init(u: String) {
        userLogin = u
    }
    
    mutating func updateUserLogin (_ userlogin: String) {
        userLogin = userlogin
    }
    
    func returnUserLogin() -> String {
        return userLogin
    }
}
