//
//  TemperatureView.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/10/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct TemperatureView: View {
    @GestureState var isDragging = false
    
    @State var currentState = CGSize.zero
    @State var finalState = CGSize.zero
    @State private var position = CGPoint(x: 100, y: 100)
    
    private var dragDiametr: CGFloat = 200.0
    
    var body: some View {
        let current = currentState.width + finalState.width
        let final = finalState.width + finalState.height
        let trimFraction = (final + current) / 250
        
        return VStack(spacing: 24) {
            ZStack {
                
                Circle()
                    .foregroundColor(Color.black)
                    .frame(width: screen.width / 1.2, height: screen.width / 1.2)
                .clipShape(Circle())
                .overlay(
                    ZStack {
                        
                        Circle()
                            .trim(from: 0.2, to: 1)
                            .stroke(style: StrokeStyle(lineWidth: 50, lineCap: .round))
                            .rotationEffect(Angle(degrees: 54))
                            .frame(width: screen.width / 1.5, height: screen.width / 1.5)
                            .foregroundColor(Color.gray.opacity(0.2))
                        
                        Circle()
                            .trim(from: 0.2, to: 1)
                            .trim(from: 0.2 - trimFraction, to: 1)
                            .stroke(style: StrokeStyle(lineWidth: 40, lineCap: .round))
                            .rotationEffect(Angle(degrees: 54))
                            .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y: 1, z: 0))
                            .frame(width: screen.width / 1.5, height: screen.width / 1.5)
                            .foregroundColor(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)).opacity(0.8))
                        
                            .gesture(
                                DragGesture().onChanged { value in
                                    self.currentState = value.translation
                                }
                                .onEnded { value in
                                    self.finalState = self.currentState
                                    self.currentState = CGSize.zero
                                }
                        )
                        
                        Circle()
                            .trim(from: 0.2, to: 1)
                            .trim(from: 0.4, to: 1)
                            .stroke(style: StrokeStyle(lineWidth: 40, lineCap: .round))
                            .rotationEffect(Angle(degrees: 54))
                            .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y: 1, z: 0))
                            .frame(width: screen.width / 1.5, height: screen.width / 1.5)
                            .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.5))
                    }
                )
                    .shadow(color: Color.white.opacity(0.1), radius: 12, x: -18, y: -18)
                    .shadow(color: Color.black.opacity(0.5), radius: 12, x: 18, y: 18)

                
                VStack {
                    Text("Set to - ")
                        .foregroundColor(Color.gray)
                    Text("74º F")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                }
            }
            VStack {
                Text("Current House Temp - ")
                    .foregroundColor(Color.gray)
                Text("69º F")
                    .bold()
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
