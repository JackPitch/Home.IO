//
//  HomeButton.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/10/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct HomeMenu: View {
    @State var homePress = false
    @State var lightPress = false
    @State var presentProfile: Bool = false
    
    @Binding var boolArray: [Bool]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.presentProfile.toggle()
                    }) {
                        Image(systemName: "person")
                        .resizable()
                            .foregroundColor(Color(UIColor.systemGray5))
                            .frame(width: 20, height: 20)
                            .background(
                                Circle()
                                    .foregroundColor(.clear)
                                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.05), Color.black.opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .clipShape(Circle())
                                .frame(width: 40, height: 40)
                                    .shadow(color: Color.white.opacity(0.2), radius: 8, x: -8, y: -8)
                                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 8, y: 8)
                        )
                    }
                    .padding(.trailing, 30)
                    .padding(.bottom, 20)
                    .sheet(isPresented: $presentProfile) {
                        ProfileSheet(presentSheet: self.$presentProfile)
                    }
                }
                HStack(spacing: 25) {
                    HomeButton(boolIndex: 0, boolArray: $boolArray, press: $boolArray[0], imageName: "thermometer")
                        
                    HomeButton(boolIndex: 1, boolArray: $boolArray, press: $boolArray[1], imageName: "lightBulb")
                    
                    HomeButton(boolIndex: 2, boolArray: $boolArray, press: $boolArray[2], imageName: "homeLock")
                    
                    HomeButton(boolIndex: 3, boolArray: $boolArray, press: $boolArray[3], imageName: "speaker")
                }
            }
        }
    .navigationBarTitle("")
    .navigationBarHidden(true)
    }
}

struct HomeButton: View {
    @State var boolIndex: Int
    @Binding var boolArray: [Bool]
    @Binding var press: Bool
    @State var imageName: String = "thermometer"
    
    var body: some View {
        ZStack {
            
            Image(uiImage: UIImage(named: imageName)!)
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 60)
                .background(press ? LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.9), Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(0.6), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: press ? Color.white.opacity(0.2) : Color.black.opacity(1.0), radius: 4, x: -2, y: -2)
            .onTapGesture {
                self.press.toggle()
                
                for (bool, _) in self.boolArray.enumerated() {
                    self.boolArray[bool] = false
                }
                self.boolArray[self.boolIndex] = true
            }
        }
    }
}

struct HomeMenu_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenu(boolArray: .constant([false, false, false, false]))
    }
}
