//
//  ProfileSheet.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/15/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct ProfileSheet: View {
    @Binding var presentSheet: Bool
    @State var presentImagePicker = false
    @State var selectedImage = UIImage()
    @ObservedObject var user = UserStore()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.9), Color.black.opacity(0.65)]), startPoint: .bottom, endPoint: .top)
            .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.presentSheet.toggle()
                    }) {
                        Text("Done")
                        .foregroundColor(.accentColor)
                            .padding(.top, 30)
                            .padding(.trailing, 30)
                    }
                }
                VStack(spacing: 30) {
                    Image(systemName: "person.crop.circle.fill")
                    .resizable()
                        .foregroundColor(.white)
                    .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                            .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round))
                            .overlay(
                                Image(uiImage: selectedImage)
                                .scaledToFit()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                            )
                        )
                        .shadow(color: Color.black.opacity(0.2), radius: 22, x: 12, y: 12)
                    Button(action: {
                        self.presentImagePicker.toggle()
                    }) {
                        Text("Set Photo")
                        .foregroundColor(.accentColor)
                    }
                    Text("Username")
                        .foregroundColor(Color(UIColor.systemGray5))
                        .bold()
                        .font(.title)
                        .padding(.top, 50)
                }
                .padding(.top, 50)
                Spacer()
                VStack(spacing: 100) {
                    
                    Button(action: {
                        print("Signing out...")
                    }) {
                        Text("Sign Out")
                        .foregroundColor(.gray)
                    }
                }
                .padding(.bottom, 50)
            }
        }
        .sheet(isPresented: $presentImagePicker) {
            ImagePickerView(isPresented: self.$presentImagePicker, selectedImage: self.$selectedImage)
        }
    }
}

struct ProfileSheet_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSheet(presentSheet: .constant(true))
    }
}
