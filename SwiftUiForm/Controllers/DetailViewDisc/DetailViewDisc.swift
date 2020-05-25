//
//  DetailViewDisc.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 21.04.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import SwiftUI

struct DetailViewDisc: View {
    
//        var questions:Question
        @State private var selection = 1
//        @Binding var showingNew: Bool
        @State var textQuestion: String = ""
        @State var textComment: String = ""
        var report = ["Детальный отчет", "Продукторый отчет", "Геолокация", "Берюза"]
        @State var reportName = ""
        @State var reportQuestion = ""
        @State var reportComment = ""
        var question:Question
        @State var textHeight: CGFloat = 120
        
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1185091361, green: 0.1185343638, blue: 0.1819397807, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Вид обращения")
                    .font(.callout)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.4676678777, green: 0.8382721543, blue: 0.9352027774, alpha: 1)))
                    .frame(width: UIScreen.main.bounds.size.width-30, alignment: .leading)

                VStack(alignment: .leading) {
                    Image(Glossary.isTag(numTag: question.imageNameId))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 25)
                        .padding(.bottom)
                    
                }
                VStack(alignment: .leading){
                        Text("Отчет")
                        .font(.callout)
                        .foregroundColor(Color.init(#colorLiteral(red: 0.4676678777, green: 0.8382721543, blue: 0.9352027774, alpha: 1)))
                    
                    HStack {
                        ScrollView(showsIndicators: false, content:{
                            Text(question.name)
                            .font(.callout)
                            .foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .padding()
                            
                        })
                        .disabled(false)
                        .lineLimit(5)
                        .frame(width: UIScreen.main.bounds.size.width-30, height: 50)
                        
                        
                      }
                    .background(Color.init(#colorLiteral(red: 0.2196078431, green: 0.231372549, blue: 0.3137254902, alpha: 0.5)))
//                    .foregroundColor(Color.white)
//                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(Color.gray, lineWidth: 1))
                    Text("Причина обращения")
                    
                    .font(.callout)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.4676678777, green: 0.8382721543, blue: 0.9352027774, alpha: 1)))
                    HStack {
                        ScrollView(showsIndicators: false, content:{
                            Text(question.question)
                                
                            .font(.callout)
                            .foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .padding()
                            
                        })
                        .disabled(false)
                        .lineLimit(5)
                        .frame(width: UIScreen.main.bounds.size.width-30, height: 70, alignment: .leading)
                        
                        
                      }
                    .background(Color.init(#colorLiteral(red: 0.2196078431, green: 0.231372549, blue: 0.3137254902, alpha: 0.5)))
//                    .padding()
//                    .foregroundColor(Color.white)
//                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(Color.gray, lineWidth: 1))
                    Text("Комментарий")
                    .font(.callout)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.4676678777, green: 0.8382721543, blue: 0.9352027774, alpha: 1)))
                    HStack {
                              ScrollView(showsIndicators: false, content: {
                                Text(question.description)
                                .font(.callout)
                                .foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .padding()
                      })
                        .disabled(false)
                        .lineLimit(7)
                        .frame(width: UIScreen.main.bounds.size.width-30, height: 150, alignment: .leading)
                    }.background(Color.init(#colorLiteral(red: 0.2196078431, green: 0.231372549, blue: 0.3137254902, alpha: 0.5)))
                        
//                    .padding()
//                    .foregroundColor(Color.white)
//                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(Color.gray, lineWidth: 1))
                }
                Spacer()
            }.padding(.top, -50)

        }
    }
}

struct DetailViewDisc_Previews: PreviewProvider {

    
    static var previews: some View {
        DetailViewDisc( question: questionData[0] )
    }
}
