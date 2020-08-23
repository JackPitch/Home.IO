//
//  ContentView.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/9/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        return sqrt(pow((point.x - x), 2) + pow((point.y - y), 2))
    }
}

struct HomeView: View {
    @State var boolArray: [Bool] = [true, false, false, false]
    @ObservedObject var user = UserStore()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.9), Color.black.opacity(0.65)]), startPoint: .bottom, endPoint: .top)
            .edgesIgnoringSafeArea(.all)
            
            ZStack {
                VStack(spacing: 50) {
                    HomeMenu(boolArray: $boolArray)
                        .padding(.top)
                    Spacer()
                }

                if(boolArray[0]) {
                    TempView()
                } else if(boolArray[1]) {
                    LightView()
                } else if(boolArray[2]) {
                    DoorView()
                } else if(boolArray[3]) {
                    SpeakerView()
                }
            }
            .navigationBarTitle("")
        .navigationBarHidden(true)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif

var screen = UIScreen.main.bounds


