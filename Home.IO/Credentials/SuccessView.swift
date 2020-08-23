//
//  SuccessView.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/18/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct SuccessView: View {
    @Binding var isPresented: Bool
    @State var message: String = "Successfully Created User!"
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 45) {
                Image(systemName: "checkmark.shield")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .frame(width: 150, height: 150)
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 4, y: 4)
                Text(message)
                    .foregroundColor(Color(UIColor.systemGray5))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
            }
            .frame(width: 300, height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)), Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 8)
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(isPresented: .constant(true))
    }
}
