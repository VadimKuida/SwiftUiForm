//
//  PickerView.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 30.04.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import SwiftUI

struct PickerView: View {
    
    @State private var selection = 0
    let colors = ["Red","Yellow","Green","Blue"]
    
    var body: some View {
        // 2.
        List
         {
            ForEach(0 ..< colors.count) { index in
                Text(self.colors[index]).tag(index)
            }
        }
    }
}


struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
