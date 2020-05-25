//
//  VideoView.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 07.04.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import SwiftUI

struct VideoView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var videoTitle: String
    @Binding var videoDescription: String
    
//    @EnvironmentObject var channelData: ChannelData
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Video title", text: $videoTitle)
                TextField("Video description", text: $videoDescription)
                Divider()
                Button(action: {
                    print("13579")
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Dismiss this VC")
                })
                Spacer()
            }.padding()
//            .navigationBarTitle("\(channelData.channelName)")
        }
    }
}


