//
//  RoomLightView.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/11/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct RoomLightView: View {
    @State var isOn = false
    @State var title: String
    @State var brightNessLevels: CGFloat = 2
    @Binding var showRoom: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.9), Color.black.opacity(0.7)]), startPoint: .bottom, endPoint: .top)
            .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: screen.width / 4) {
                    Text(title)
                        .bold()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    VStack(spacing: 30) {
                        Image(systemName: "lightbulb")
                            .resizable()
                            .foregroundColor(isOn ? Color(#colorLiteral(red: 0.6687981592, green: 0.7852900257, blue: 0.9241759418, alpha: 1)) : .gray)
                            .frame(width: 50, height: 70)
                            .shadow(color: isOn ? Color.white : .clear, radius: 22, x: 0, y: 0)
                        
                        Toggle(isOn: $isOn) {
                            Text("Lights: \(isOn ? "ON" : "OFF")")
                            .bold()
                            .foregroundColor(isOn ? Color.white : Color.gray)
                        }
                        .toggleStyle(CustomToggle())
                    }
                    .frame(width: screen.width / 2, height: screen.width / 1.5)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: isOn ? Color.white.opacity(Double(brightNessLevels / 8)) : Color.white.opacity(0.1), radius: isOn ? 22 : 8, x: isOn ? 0 : -12, y: isOn ? 0 : -12)
                    .shadow(color: isOn ? .clear : Color.black.opacity(0.8), radius: 8, x: 12, y: 12)
                    .animation(.easeIn)
                                
                    LightDimBar(lightDimness: $brightNessLevels)
                }
            }.navigationBarItems(trailing: DoneButton(showRoom: $showRoom))
        }
    }
}

struct LightDimBar: View {
    @Binding var lightDimness: CGFloat
    
    var body: some View {
        ZStack {
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .frame(width: screen.width - 45, height: 12)
                        .foregroundColor(Color.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), Color.gray.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(12)
                    
                    Slider(value: $lightDimness, in: 1...7, step: 0.5)
                        .frame(width: screen.width - 50)
                }
                Text("Adjust Brightness Levels")
                    .bold()
                    .foregroundColor(Color.gray)
            }
        }
    }
}


struct CustomToggle: ToggleStyle {
    var onColor = Color(#colorLiteral(red: 0.6687981592, green: 0.7852900257, blue: 0.9241759418, alpha: 1))
    var offColor = Color(.gray)
    var thumbColor = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing)
    
    var buttonWidth: CGFloat = 100
    
    func makeBody(configuration: Configuration) -> some View {
        let offset = buttonWidth * 0.2
        
        return VStack {
            configuration.label
                        
            RoundedRectangle(cornerRadius: 30, style: .circular)
                .fill(configuration.isOn ? onColor : offColor)
                .frame(width: 100, height: buttonWidth * 0.6)
            .overlay(
                ZStack {
                    Circle()
                    .fill(thumbColor)
                        .shadow(radius: 1, x: 0, y: 1)
                        .padding(1.5)
                        .offset(x: configuration.isOn ? offset : -offset)
                        .animation(Animation.easeInOut(duration: 0.2))
                    Circle()
                        .foregroundColor(configuration.isOn ? onColor : offColor)
                        .frame(width: 8, height: 8)
                        .offset(x: configuration.isOn ? offset: -offset)
                        .animation(Animation.easeInOut(duration: 0.2))
                }
                .onTapGesture {
                        configuration.isOn.toggle()
                }
            )
        }
    }
    
    
}

struct RoomLightView_Previews: PreviewProvider {
    static var previews: some View {
        RoomLightView(title: "Bathroom", showRoom: .constant(true))
    }
}
