//
//  Glossary.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 22.04.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import Foundation

class Glossary{
    
    static func isTag (numTag: Int) -> String {

        switch numTag {
        case 0:
            return "problem"
        case 1:
            return "question"
        case 2:
            return "sentence"
        default:
            return "question"
        }
    }
    
}
