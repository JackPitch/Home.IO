//
//  LoginView.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/16/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var navIsActive = false
    @State var presentError: Bool = false
    @State var presentSignUp: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.9), Color.black.opacity(0.65)]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
                VStack(spacing: screen.width / 2) {
                    Text("Home.IO")
                    .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                        .shadow(color: Color.black.opacity(0.8), radius: 4, x: 8, y: 8)
                    
                    VStack(spacing: screen.width / 5) {
                        VStack(spacing: 20) {
                            VStack {
                                HStack {
                                    Image(systemName: "envelope.fill")
                                        .foregroundColor(.white)
                                    .frame(width: 40, height: 40)
                                        .background(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                                        .clipShape(RoundedRectangle(cornerRadius: 6))
                                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 8)
                                    TextField("Enter Email", text: $email)
                                }
                                .padding(.bottom, 8)
                                Divider()
                                HStack {
                                    Image(systemName: "lock.fill")
                                        .foregroundColor(.white)
                                        .frame(width: 40, height: 40)
                                        .background(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                                        .clipShape(RoundedRectangle(cornerRadius: 6))
                                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 8)
                                    SecureField("Enter Password", text: $password)
                                }
                                .padding(.top, 8)
                            }
                            .frame(width: screen.width - 50, height: 135)
                            .padding()
                            .background(Color(#colorLiteral(red: 0.8493150685, green: 0.8948790668, blue: 0.9795055651, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                            
                            NavigationLink(destination: HomeView()) {
                                RoundedRectangle(cornerRadius: 22, style: .continuous)
                                .frame(width: screen.width - 50, height: 75)
                                    .foregroundColor(.clear)
                                    .background(
                                        getDisabledStatus(email: self.email, password: self.password) ?
                                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading) :
                                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading)
                                )
                                    
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .overlay(
                                    Text("Login")
                                        .bold()
                                        .font(.title)
                                        .foregroundColor(getDisabledStatus(email: self.email, password: self.password) ? .gray : .white)
                                )
                                .animation(.easeIn)
                            }
                            .disabled(getDisabledStatus(email: self.email, password: self.password))
                        }
                        .frame(width: screen.width - 45)
                        .padding()
                        //.background(Color(#colorLiteral(red: 0.945125214, green: 0.9768032962, blue: 1, alpha: 1)).opacity(0.2))
                        //.clipShape(RoundedRectangle(cornerRadius: 22))
                        
                        HStack {
                            Text("Don't Have an Account?")
                                .foregroundColor(Color(UIColor.systemGray2))
                            Button(action: {
                                self.presentSignUp.toggle()
                            }) {
                                Text("Sign Up")
                                    .foregroundColor(.accentColor)
                            }
                            .sheet(isPresented: $presentSignUp) {
                                SignUpView(presentSignUp: self.$presentSignUp)
                            }
                        }
                    }
                    
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
                ErrorView(isPresented: $presentError, message: "User doesn't exist")
                    .opacity(presentError ? 1 : 0)
                    .animation(.easeInOut)
            }
        }
    }
}

struct LoginButton: View {
    @Binding var navIsActive: Bool
    @Binding var presentError: Bool
    @Binding var password: String
    @Binding var email: String
    @ObservedObject var user = UserStore()
    
    var body: some View {
        Button(action: {
            print("Login")
        }) {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
            .frame(width: screen.width - 50, height: 75)
                .foregroundColor(.clear)
                .background(
                    getDisabledStatus(email: self.email, password: self.password) ?
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading) :
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading)
            )
                
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                Text("Login")
                    .bold()
                    .font(.title)
                    .foregroundColor(getDisabledStatus(email: self.email, password: self.password) ? .gray : .white)
            )
            .animation(.easeIn)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

func getDisabledStatus(email: String, password: String) -> Bool {
    return email.count < 5 || password.count < 6
}
