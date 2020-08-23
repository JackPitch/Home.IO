//
//  ErrorView.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/17/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    @Binding var isPresented: Bool
    @State var message: String = "This user doesn't exist"
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.9), Color.black.opacity(0.65)]), startPoint: .bottom, endPoint: .top)
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 45) {
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    .frame(width: 100, height: 100)
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 4, y: 4)
                Text(message)
                    .foregroundColor(Color(UIColor.systemGray5))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                Button(action: {
                    print("dismiss view")
                    self.isPresented = false
                }) {
                    Text("Ok")
                        .bold()
                        .foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                }
            }
            .frame(width: 300, height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 8)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(isPresented: .constant(true))
    }
}
