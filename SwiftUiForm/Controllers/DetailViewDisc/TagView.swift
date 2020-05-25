//
//  TagView.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 22.04.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import SwiftUI

struct TagView: View {
    
    @State var colortags = ["problem","question","sentence"]
    @State var selecttag = 0
    
    var body: some View {
        


            HStack{
                ForEach(self.colortags, id: \.self) { colortag in
                        Button(action: {
                            switch colortag {
                            case "problem":
                            self.colortags = ["problem","question_no","sentence_no"]
                                self.selecttag = 0
                            case "problem_no":
                            self.colortags = ["problem","question_no","sentence_no"]
                                self.selecttag = 0
                            case "question":
                            self.colortags = ["problem_no","question","sentence_no"]
                                self.selecttag = 1
                            case "question_no":
                            self.colortags = ["problem_no","question","sentence_no"]
                                self.selecttag = 1
                            case "sentence":
                            self.colortags = ["problem_no","question_no","sentence"]
                                self.selecttag = 2
                            case "sentence_no":
                            self.colortags = ["problem_no","question_no","sentence"]
                                self.selecttag = 2
                            default:
                                print("0")
                            }
                            print(self.selecttag)
                        }){
                            Image(colortag)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 25)
                             
                            
                        }
                }
            }
        
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(colortags: [], selecttag: 0)
    }
}
