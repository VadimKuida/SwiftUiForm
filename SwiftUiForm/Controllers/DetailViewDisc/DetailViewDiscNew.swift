//
//  DetailViewDiscNew.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 23.04.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import SwiftUI

struct DetailViewDiscNew: View {
        
    //        var questions:Question
            @State private var selection = 1
            @Binding var showingNew: Bool
            @State var textQuestion: String = ""
            @State var textComment: String = ""
            var report = ["Детальный отчет", "Продукторый отчет", "Геолокация", "Берюза"]
            @State var reportName = ""
            @State var reportQuestion = ""
            @State var reportComment = ""
    //        var questions: [Question]
            @State var textHeight: CGFloat = 120
            @State private var reportIndex = 0
            
        var body: some View {
            ZStack {
                Color(#colorLiteral(red: 0.1185091361, green: 0.1185343638, blue: 0.1819397807, alpha: 1)).edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Выберите тег")
                        .font(.callout)
                        .foregroundColor(Color.init(#colorLiteral(red: 0.4676678777, green: 0.8382721543, blue: 0.9352027774, alpha: 1)))
                        .frame(width: UIScreen.main.bounds.size.width-30, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        TagView(colortags: ["problem","question","sentence"], selecttag: 0)
                            .padding(.bottom)
                    }
                    VStack(alignment: .leading){
                            Text("Выберите отчет")
                            .font(.callout)
                            .foregroundColor(Color.init(#colorLiteral(red: 0.4676678777, green: 0.8382721543, blue: 0.9352027774, alpha: 1)))
                        
                            Form{
                                Section{
                                    Picker(selection: $reportIndex, label: Text("Отчет"))
                                    {
                                        Text("Детальный").tag(0)
                                        Text("Атлас").tag(1)
                                        Text("Продуктовый").tag(2)
                                    }
                                }.frame(width: 300, height: 50)
                                }.frame(width: 300, height: 50)
                            
//                        .padding()
                        .background(Color.init(#colorLiteral(red: 0.2196078431, green: 0.231372549, blue: 0.3137254902, alpha: 0.5)))
    //                    .foregroundColor(Color.white)
    //                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(Color.gray, lineWidth: 1))
                        Text("Коротко опишите причину обращения")
                        
                        .font(.callout)
                        .foregroundColor(Color.init(#colorLiteral(red: 0.4676678777, green: 0.8382721543, blue: 0.9352027774, alpha: 1)))
                        HStack {
                                  ScrollView {
                              TextView(placeholder: "", text: self.$textQuestion, minHeight: self.textHeight, calculatedHeight: self.$textHeight)
                              .frame(minHeight: self.textHeight, maxHeight: self.textHeight)
                          }
                            .disabled(false)
                            .lineLimit(5)
                            .frame( height: 70)
                          }
                        .background(Color.init(#colorLiteral(red: 0.2196078431, green: 0.231372549, blue: 0.3137254902, alpha: 0.5)))
    //                    .padding()
    //                    .foregroundColor(Color.white)
    //                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(Color.gray, lineWidth: 1))
                        Text("Комментарий")
                        .font(.callout)
                        .foregroundColor(Color.init(#colorLiteral(red: 0.4676678777, green: 0.8382721543, blue: 0.9352027774, alpha: 1)))
                        HStack {
                                  ScrollView {
                              TextView(placeholder: "", text: self.$textComment, minHeight: self.textHeight, calculatedHeight: self.$textHeight)
                              .frame(minHeight: self.textHeight, maxHeight: self.textHeight)
                          }
                            .disabled(false)
                            .lineLimit(7)
                            .frame( height: 150)
                        }.background(Color.init(#colorLiteral(red: 0.2196078431, green: 0.231372549, blue: 0.3137254902, alpha: 0.5)))
                            
    //                    .padding()
    //                    .foregroundColor(Color.white)
    //                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(Color.gray, lineWidth: 1))
                    }
                    Spacer()
                }.padding()

            }
        }
}

struct DetailViewDiscNew_Previews: PreviewProvider {

        
        static var previews: some View {
    //        DetailViewDisc(showingNew: .constant(true))
            DetailViewDiscNew(showingNew: .constant(true))
        }
}
