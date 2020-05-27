//
//  DetailView.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 19.03.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import SwiftUI
import Firebase




struct DetailView: View {
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var uidUser: String
    @Binding var firstName: String
//    @State var q1: String
    @ObservedObject var uidPubDet = PublicVar()
//    @ObservedObject var fetch = FetchToDo()
    var questions:[Question]
    @State var showingNew = false
    
    var body: some View {
              
        ZStack {
            Color(#colorLiteral(red: 0.1185091361, green: 0.1185343638, blue: 0.1819397807, alpha: 1)).edgesIgnoringSafeArea(.all)
           VStack{
                      Text("Привет \(self.firstName)!!!").font(Font.custom("Circe", size: 20))
                      .foregroundColor(Color.init(#colorLiteral(red: 0.7843137255, green: 0.7803921569, blue: 0.8, alpha: 1)))
                          .frame(width: 300, height: 40, alignment: .top)
                          .padding(.top, 40)
            
            ScrollView(showsIndicators: false) {
                CustomFormList().padding().frame(width: 320)
            }
            } //ZStack
//                    .navigationBarTitle(Text("Привет \(self.firstName)!!!"))
//                            .edgesIgnoringSafeArea(.top)

      
                            .navigationBarItems(
                            trailing: Button(action: {self.showingNew.toggle() })
                                {
                                    Image(systemName: "plus.circle")
                                }
                                .sheet(isPresented: $showingNew) {
//                                    DetailViewDisc(showingNew: self.$showingNew)
                                    DetailViewDiscNew(showingNew: self.$showingNew)

                            })
            
              
        }.padding(.top, -80)

    }
    
}

struct DetailView_Previews: PreviewProvider {
    
    @State static var firstName = ""
    @State static var uidUser = ""
   
    static var previews: some View {
        DetailView(uidUser: $uidUser, firstName: $firstName, questions: questionData)
    }
}
