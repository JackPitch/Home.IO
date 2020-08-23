//
//  AddDoor.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/12/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct SheetView: View {
    @Binding var isBlurred: Bool
    
    @State var draggedOffset = CGSize.zero
    @State var finalOffset = CGSize.zero
    @State var showForm = false

    var body: some View {
//        ZStack {
//            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.9), Color.black.opacity(0.7)]), startPoint: .bottom, endPoint: .top)
//            .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 60, style: .continuous)
                    .foregroundColor(Color.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))]), startPoint: .bottom, endPoint: .top))
                    .clipShape(RoundedRectangle(cornerRadius: 60))
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(Color(UIColor.systemGray5))
                            .frame(width: 70, height: 8)
                            .shadow(color: Color.black.opacity(0.9), radius: 8, x: 6, y: 6)
                            .padding(.top, 18)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        self.draggedOffset = value.translation
                                        
                                    if(self.showForm) {
                                        if(value.translation.height < 0) {
                                            self.draggedOffset = CGSize.zero
                                        }
                                    }
                                }
                                .onEnded { value in
                                    
                                    if(self.draggedOffset.height > 80) {
                                        self.showForm = false
                                        self.isBlurred = false
                                    }
                                    
                                    if(self.draggedOffset.height < -100) {
                                        self.showForm = true
                                        self.isBlurred = true
                                    }
                                    self.draggedOffset = CGSize.zero
                                }
                            )
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            AddDoorButton()
                            Spacer()
                        }.padding(.trailing, 12)
                    }.padding(.top, 8)
                    
                    VStack(spacing: 40) {
                        ZStack {
                            VStack {
                                Text("Bedroom")
                                .bold()
                                .foregroundColor(Color(UIColor.systemGray6))
                                
                                ZStack {
                                    Image(uiImage: #imageLiteral(resourceName: "bedroom"))
                                    .resizable()
                                        .frame(width: screen.width / 1.2, height: screen.width / 1.5)
                                    .blur(radius: 4)
                                        .shadow(color: Color.black, radius: 12, x: 0, y: 12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                                        .foregroundColor(.white)
                                    )
                                    Image(systemName: "video.slash.fill")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 50, height: 50)
                                }
                            }
                        }
                        ZStack {
                            VStack {
                                Text("Living Room")
                                .bold()
                                .foregroundColor(Color(UIColor.systemGray6))
                                
                                ZStack {
                                    Image(uiImage: #imageLiteral(resourceName: "livingRoom"))
                                    .resizable()
                                        .frame(width: screen.width / 1.2, height: screen.width / 1.5)
                                    .blur(radius: 4)
                                        .shadow(color: Color.black, radius: 12, x: 0, y: 12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                                        .foregroundColor(.white)
                                    )
                                    Image(systemName: "video.slash.fill")
                                      .resizable()
                                      .foregroundColor(.white)
                                      .frame(width: 50, height: 50)
                                }
                            }
                        }
                    }.padding(.top, 80)
                }
            }
            .offset(x: 0, y: showForm ? 50 : screen.width * 1.77)
            .offset(y: self.draggedOffset.height)
            .animation(.spring())
        }
    }


struct AddDoorButton: View {
    var body: some View {
        ZStack {
            
            Circle()
                .frame(width: 90, height: 90)
            .foregroundColor(Color.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .clipShape(Circle())
            .overlay(
                Circle()
                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                .foregroundColor(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
            )
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2), radius: 12, x: 12, y: 12)
            
            HStack(spacing: 4) {
                Image(systemName: "plus")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 22, height: 22)
                Image(uiImage: #imageLiteral(resourceName: "shieldLock"))
                    .shadow(color: Color.white.opacity(0.8), radius: 22, x: 0, y: 0)
            }
        }
    }
}

#if DEBUG
struct AddDoor_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(isBlurred: .constant(false))
    }
}
#endif
