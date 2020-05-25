//
//  CustomForm.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 16.04.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import SwiftUI

   

struct CustomForm: View {
    var question:Question
    var body: some View {

        ZStack(alignment: .trailing){

            VStack(alignment: .leading){
               
            Text(question.name).font(Font.custom("Circe", size: 10))
                .foregroundColor(Color.init(#colorLiteral(red: 0.7843137255, green: 0.7803921569, blue: 0.8, alpha: 1)))
                .padding([.leading, .bottom])
                .lineLimit(1)
             Text(question.question).font(Font.custom("Circe", size: 15))
                .foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .padding([.leading, .bottom])
                .lineLimit(1)
            Text(question.description).font(Font.custom("Circe", size: 10))
                .foregroundColor(Color.init(#colorLiteral(red: 0.7843137255, green: 0.7803921569, blue: 0.8, alpha: 1)))
                .padding([.leading, .bottom])
                .lineLimit(2)
       
                
        }.frame(width: 320, height: 120, alignment: .leading)
            .background(Color.init(#colorLiteral(red: 0.2196078431, green: 0.231372549, blue: 0.3137254902, alpha: 1)))
            .cornerRadius(10)
            .shadow(radius: 10)
          
        
            Image(Glossary.isTag(numTag: question.imageNameId) )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 20)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0))
            
        }
    }
    
}

struct CustomForm_Previews: PreviewProvider {
    static var previews: some View {
        CustomForm(question: questionData[2])
    }
}
