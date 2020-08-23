//
//  LightView.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/10/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct LightView: View {
    @State var showCreate = false
    @State var showRoom = false
    
    var body: some View {
            ZStack {
                
                VStack(spacing: screen.width / 12) {
                    
                    Spacer()
                    Spacer()
                                    
                    HStack(spacing: screen.width / 16) {
                        RoomCard().onTapGesture {
                            self.showRoom.toggle()
                        }

                            RoomCard(title: "Living Room", lightStatus: true).onTapGesture {
                                self.showRoom.toggle()
                            }
                    }
                    
                    HStack(spacing: screen.width / 16) {
                            RoomCard(title: "Kitchen", lightStatus: false).onTapGesture {
                                self.showRoom.toggle()
                            }
                        
                            RoomCard(title: "Downstairs", lightStatus: false).onTapGesture {
                                self.showRoom.toggle()
                            }
                    }
                    
                    Spacer()
                                    
                    AddLightButton(showCreate: $showCreate)
                }
                .accentColor(Color.white)
                .sheet(isPresented: $showRoom) {
                    RoomLightView(title: "Bedroom", showRoom: self.$showRoom)
                }
            }
        }
    }


struct LightView_Previews: PreviewProvider {
    static var previews: some View {
        LightView()
    }
}

struct DoneButton: View {
    @Binding var showRoom: Bool
    
    var body: some View {
        Button(action: {
            self.showRoom.toggle()
        }) {
            Text("Done")
                .foregroundColor(.accentColor)
        }
    }
}

struct RoomCard: View {
    @State var title: String = "Bedroom"
    @State var lightStatus: Bool = false
    
    var body: some View {
        VStack {
            
            Image(uiImage: lightStatus ? #imageLiteral(resourceName: "lightOff") : #imageLiteral(resourceName: "lightOn"))
                .rotationEffect(.init(degrees: 180))
            
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                Text(title)
                    .bold()
                    .foregroundColor(Color.white)
                    .font(.headline)
                Text("Lights Are \(lightStatus ? "On" : "Off")")
                    .bold()
                    .foregroundColor(Color.gray)
            }
        }.frame(width: screen.width / 3, height: screen.width / 3)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2)]), startPoint: .bottom, endPoint: .top))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black, radius: 8, x: 8, y: 8)
        .shadow(color: lightStatus ? Color.white.opacity(0.5) : Color.white.opacity(0.2), radius: 8, x: -8, y: -8)
    }
}

struct AddLightButton: View {
    @Binding var showCreate: Bool
    
    var body: some View {
        Button(action: {
            self.showCreate.toggle()
        }) {
            VStack {
                HStack {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 20, height: 20)
                    Image(systemName: "lightbulb")
                        .resizable()
                        .frame(width: 40, height: 60)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    
                }
                .frame(width: 100, height: 100)
                    .background((LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                            .rotation(Angle(degrees: -45))
                            .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                    )
                    .shadow(color: Color.black, radius: 12, x: 8, y: 8)
                    .shadow(color: Color.white.opacity(0.1), radius: 12, x: -8, y: -8)
                
                Text("Add Room")
                    .foregroundColor(Color.white).bold()
            }
        }
    }
}
