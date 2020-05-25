//
//  PublicVar.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 02.04.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//


import Combine

final class PublicVar: ObservableObject {
    @Published var uid: String = "111"
    @Published var firstName: String = ""
    
}
