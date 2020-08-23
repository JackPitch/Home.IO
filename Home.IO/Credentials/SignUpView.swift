//
//  SignUpView.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/16/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @Binding var presentSignUp: Bool
    @State var presentSuccess: Bool = false
    @State var presentError: Bool = false
    @State var selectImage: Bool = false
    @State var password: String = ""
    @State var username: String = ""
    @State var email: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.9), Color.black.opacity(0.65)]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: screen.width / 9) {
                VStack(spacing: screen.width / 3) {
                    VStack(spacing: 30) {
                        Image(systemName: "person.crop.circle")
                        .resizable()
                            .foregroundColor(.white)
                            .frame(width: 200, height: 200)
                            .scaledToFill()
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.8), radius: 5, x: 6, y: 6)
//                            .overlay(
//                                Image(uiImage: profileImage)
//                                .resizable()
//                                    .frame(width: 200, height: 200)
//                                    .scaledToFit()
//                                .clipShape(Circle())
//                                .overlay(
//                                    Circle()
//                                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
//                                )
//                        )
                    }
                    VStack {
                        SignUpForm(email: $email, password: $password)
                        SignUpButton(presentSignUp: $presentSignUp, presentError: $presentError, password: $password, email: $email, presentSuccess: $presentSuccess)
                        .disabled(getDisabledSignInStatus(password: self.password, email: self.email))
                    }
                    .padding(.bottom, 100)
                }
                HStack {
                    Text("Already Have an Account?")
                        .foregroundColor(.gray)
                    Button(action: {

                        self.presentSignUp.toggle()
                    }) {
                        Text("Sign In")
                    }
                }
            }
            .blur(radius: presentSuccess ? 22 : 0)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            ErrorView(isPresented: $presentError, message: "Error Creating User, \nCheck Email Format")
             .opacity(presentError ? 1 : 0)
             .animation(.easeInOut)
            
            SuccessView(isPresented: $presentSuccess)
                .opacity(presentSuccess ? 1 : 0)
                .scaleEffect(presentSuccess ? 1 : 0)
                .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0))
        }
    .navigationBarTitle("")
    .navigationBarHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(presentSignUp: .constant(true))
    }
}

struct SignUpButton: View {
    @ObservedObject var user = UserStore()
   // @Binding var image: UIImage
    @Binding var presentSignUp: Bool
    @Binding var presentError: Bool
    @Binding var password: String
    @Binding var email: String
    @Binding var presentSuccess: Bool
        
    var body: some View {
        Button(action: {
            self.presentSuccess = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self.presentSuccess = false
                self.presentSignUp = false
            }
        }) {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
            .frame(width: screen.width - 50, height: 50)
                .foregroundColor(.clear)
                .background(
                    getDisabledSignInStatus(password: self.password, email: self.email) ?
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading) :
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading)
            )
                
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                Text("Sign Up")
                    .bold()
                    .font(.title)
                    .foregroundColor(getDisabledSignInStatus(password: self.password, email: self.email) ? .gray : .white)
            )
            .animation(.easeIn)
        }
    }
}

func getDisabledSignInStatus(password: String, email: String) -> Bool {
    return password.count < 6 || email.count < 8
}

struct SignUpForm: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
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
            .padding(.top, 8)
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
            .padding(.bottom)
        }
        .frame(width: screen.width - 50, height: 135)
        .padding()
        .background(Color(#colorLiteral(red: 0.8493150685, green: 0.8948790668, blue: 0.9795055651, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }
}

