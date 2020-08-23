//
//  DoorView.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/12/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct DoorView: View {
    @State var isBlurred = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    DoorCard(title: "Front Door")
                    
                    DoorCard(title: "Kitchen Door", isLocked: true)
                }
                
                HStack(spacing: 15) {
                    DoorCard(title: "Basement Door", isOpen: true)
                    
                    DoorCard(title: "Back Door")
                }
            }
            .blur(radius: isBlurred ? 6 : 0)
            .padding(.top, 50)
            SheetView(isBlurred: $isBlurred)
        }
    }
}

struct DoorView_Previews: PreviewProvider {
    static var previews: some View {
        DoorView()
    }
}

struct DoorCard: View {
    @State var title: String
    @State var isLocked = false
    @State var isOpen = false
    
    var body: some View {
        
        VStack(spacing: 30) {
            VStack {
                Text(title)
                .bold()
                    .foregroundColor(Color.white)
                    .font(.system(size: 20))
                Text(isOpen ? "Door Open" : "Door Closed")
                    .bold()
                    .font(.system(size: 15))
                    .foregroundColor(Color(UIColor.systemGray3))
                Image(uiImage: isOpen ? #imageLiteral(resourceName: "doorOpen2") : #imageLiteral(resourceName: "doorClosed2"))
                    .resizable()
                    .frame(width: 44, height: 44)
                    .frame(width: 70, height: 70)
                    .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .clipShape(Circle())
                    .shadow(color: Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)).opacity(0.5), radius: 12, x: 0, y: 0)
            }
            VStack {
                Image(uiImage: isLocked ? #imageLiteral(resourceName: "doorLocked") : #imageLiteral(resourceName: "doorUnlocked"))
                    .onTapGesture {
                        if(self.isOpen) {
                            self.isLocked = false
                        } else {
                            self.isLocked.toggle()
                        }
                }
                Text(isLocked ? "Locked" : "Unlocked")
                    .transition(.opacity)
                    .foregroundColor(Color(UIColor.systemGray2))
            }
        }
        .frame(width: (screen.width / 2) - 20, height: screen.width / 1.5)
        .background(Color(isOpen ? #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) : #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .animation(.linear)
        .shadow(color: Color.black.opacity(0.4), radius: 22, x: 22, y: 22)
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                .foregroundColor(isLocked ? Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)) : Color.clear)
        )
    }
}
