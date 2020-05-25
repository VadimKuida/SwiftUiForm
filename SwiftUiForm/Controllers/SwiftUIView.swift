//
//  SwiftUIView.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 19.03.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import SwiftUI

struct CircleShape: Shape {
    let progress: Double
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.width/2,
                    startAngle: .radians(1.5 * .pi),
                    endAngle: .init(radians: 2 * Double.pi * progress + 1.5 * Double.pi),
                    clockwise: false)
        return path
    }
}

struct SwiftUIView: View {
    @State var pickerItem = 0
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack{
            Text("Аналитика").font(.system(size: 32)).fontWeight(.heavy)
            Picker(selection: $pickerItem, label: Text("")) {
                Text("Сентябрь")
                Text("Октябрь")
                Text("Декабрь")
            }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal, 15)
                HStack {
                    CircleView(value: 0.5)
                    CircleView(value: 0.3)
                    CircleView(value: 0.9)
                }
                HStack{
                    DiagramView(value: 13)
                    DiagramView(value: 100)
                    DiagramView(value: 150)
                }
                 Spacer()
            }
        }
    }
}



struct DiagramView: View {
    var value: CGFloat
    
    private var color: Color {
        if  value < 80 {
            return .red
        } else if value > 80 && value < 120{
            return .blue
        } else {
            return .green
        }
    }
    
    var body: some View {
        VStack{
        ZStack(alignment: .bottom){
        Rectangle().frame(width: 30, height: 200).foregroundColor(Color.white)
        Rectangle().frame(width: 30, height: value).foregroundColor(color)
        }.padding(.top, 16)
            Text("03").padding(.top, 4)
            
        }
    }
}

struct CircleView: View {
    var value: Double
    
    var body: some View{
        ZStack(alignment: .center){
        CircleShape(progress: 1).stroke(Color.white, style: StrokeStyle(
            lineWidth: 10,
            lineCap: .butt,
            lineJoin: .round,
            miterLimit: 0,
            dash: [],
            dashPhase: 0))
            CircleShape(progress: value).stroke(Color.green, style: StrokeStyle(
                lineWidth: 10,
                lineCap: .round,
                lineJoin: .round,
                miterLimit: 0,
                dash: [],
                dashPhase: 0))
            Text(String(value * 100) + "%").font(.system(size: 20)).foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
        }.padding()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
