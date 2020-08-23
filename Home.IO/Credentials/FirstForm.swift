//
//  FirstForm.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/21/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct FirstForm: View {
    @State var presentSignUp: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.9), Color.black.opacity(0.65)]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
                VStack(spacing: 150) {
                    VStack {
                        Image(uiImage: #imageLiteral(resourceName: "smart-home"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("Home.IO")
                            .bold()
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                    }
                    .frame(width: 250, height: 250)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7168503853, green: 0.8036975599, blue: 0.9181827911, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    //.shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.6), radius: 4, x: -4, y: -4)
                    .shadow(color: Color.black.opacity(0.6), radius: 4, x: 8, y: 8)
                    

                    
                    VStack(spacing: 15) {
                        NavigationLink(destination: LoginView()) {
                            Text("Login")
                                .bold()
                                .foregroundColor(.white)
                        }
                        .frame(width: screen.width - 20, height: 80)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.626364512, green: 0.7764073202, blue: 0.9248448202, alpha: 1)), Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))]), startPoint: .bottomTrailing, endPoint: .topLeading))
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .shadow(color: Color.black.opacity(0.6), radius: 12, x: 22, y: 22)
                        .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round))
                        .foregroundColor(Color(#colorLiteral(red: 0.7850492295, green: 0.8837221747, blue: 0.9686274529, alpha: 1)))
                            
                        )
                        NavigationLink(destination: SignUpView(presentSignUp: $presentSignUp)) {
                            Text("Sign Up")
                            .bold()
                            .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                        }
                        .frame(width: screen.width - 20, height: 80)
                        .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
                        .foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                        )
                    }
                }
            }
        }
    }
}

struct FirstForm_Previews: PreviewProvider {
    static var previews: some View {
        FirstForm()
    }
}
