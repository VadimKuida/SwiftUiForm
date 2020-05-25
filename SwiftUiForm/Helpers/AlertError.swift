//
//  AlertError.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 01.04.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import Foundation
import SwiftUI


func showAllert(with title: String, and message: String) {
    _ = Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("Ok")))
}
