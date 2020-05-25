//
//  CustomFormRow.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 16.04.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import SwiftUI

struct CustomFormRow: View {
    
    var questions:[Question]
        @State var showingNew = false
    
    var body: some View {
        

            ScrollView(showsIndicators: false, content: {
                ForEach(self.questions, id: \.self) { question in

//                    Button(action: {self.showingNew.toggle() }){
                    NavigationLink(destination: DetailViewDisc(question: question)) {
                    CustomForm(question: question)
                        .frame(width: 320)
                        .padding()
//                        .sheet(isPresented: self.$showingNew) {
//                        //                                    DetailViewDisc(showingNew: self.$showingNew)
//                            DetailViewDisc( showingNew: .constant(true), question: question)
//                    }
                    
                    }
                }
            }
        )
    
    }
}

struct CustomFormRow_Previews: PreviewProvider {
    static var previews: some View {
        CustomFormRow(questions: questionData)
    }
}
