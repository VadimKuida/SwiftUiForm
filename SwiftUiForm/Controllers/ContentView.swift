//
//  ContentView.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 19.03.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingLoginView = false
    
    var body: some View {
        
        NavigationView {
            
                  
            VStack(alignment: .leading) {
                GeometryReader { geometry in
                    HStack(spacing: 10){
                        NavigationLink(destination: LoginView(), label: {
                            Text("Переход")
                            })
                            .frame(width: geometry.size.width / 2 - 10 , height: 50).accentColor(Color.init(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))).background(Color.init(#colorLiteral(red: 0.9178877915, green: 0.9178877915, blue: 0.9178877915, alpha: 1))).cornerRadius(10)
                    }
                    }.padding().frame(height: 50)
                Divider()
                Spacer()
                }
        .navigationBarTitle("Обращения")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
