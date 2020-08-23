//
//  TurnOnButton.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/10/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct TurnOnButton: View {
    @State var press = false
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                
                Circle()
                    .frame(width: screen.width / 3, height: screen.width / 3, alignment: .center)
                    .foregroundColor(Color.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Circle())
                    .onTapGesture {
                        self.press.toggle()
                }
                    .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                        .rotation(Angle(degrees: -45))
                        .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                )
                    .shadow(color: press ? Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.2) : Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.2), radius: 12, x: -4, y: -4)
                    .shadow(color: press ? Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.4) : Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), radius: 12, x: 4, y: 4)
                

                
                Image(systemName: "power")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(press ? Color.white : Color.black.opacity(0.5))
                    .shadow(color: Color.white, radius: 22, x: 0, y: 0)
            }
            .animation(.easeInOut)
                .onTapGesture {
                    self.press.toggle()
            }
            
            Text(press ? "AC: ON" : "AC: OFF")
                .foregroundColor(press ? Color.white : Color.gray)
        }
    }
}

struct TurnOnButton_Previews: PreviewProvider {
    static var previews: some View {
        TurnOnButton()
    }
}
