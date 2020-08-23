//
//  SpeakerView.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/13/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct SpeakerView: View {
    @State var isOn = true
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 50) {
                        ForEach(sectionData) { item in
                            GeometryReader { geometry in
                                SpeakerCard(section: item)
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
                            }
                        }
                        .frame(width: screen.width / 1.4, height: screen.width * 1.4)
                    }
                }
                .padding(.leading, 20)
                
                AddSpeakerButton()
            }
            .padding(.top, 100)
        }
    }
}

struct SpeakerView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerView()
    }
}

struct SpeakerCard: View {
    var section: SpeakerSection
        
    var body: some View {
        VStack(alignment: .leading) {
            Text(section.title)
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 30))
                .padding(.leading)
                .padding(.top, 25)
            VStack(spacing: 30) {
                ZStack {
                    Circle()
                        .foregroundColor(.clear)
                        .frame(width: 200, height: 200)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .clipShape(Circle())
                        .shadow(color: Color.black, radius: 12, x: 12, y: 12)
                        .shadow(color: Color.white.opacity(0.2), radius: 12, x: -12, y: -12)
                        .overlay(
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .butt, miterLimit: 15, dash: [2, 50], dashPhase: 0))
                                .foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                                .frame(width: 230, height: 230)
                        )
                        .overlay(
                            Circle()
                                .trim(from: 0.2, to: 1)
                                .rotation(.init(degrees: 180))
                                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                                .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                            .frame(width: 220, height: 220)

                        )
                    Image(systemName: section.isOn ? "speaker.3" : "speaker.slash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: section.isOn ? 80 : 60, height: section.isOn ? 80 : 60)
                        .foregroundColor(section.isConnected ? Color(#colorLiteral(red: 0.5963452483, green: 0.7442208904, blue: 0.935546875, alpha: 1)) : Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                }
                
                VStack {
                    Image(uiImage: section.isConnected ? #imageLiteral(resourceName: "speakerOn") : #imageLiteral(resourceName: "speakerOff"))
                    Text("Status: \(section.isConnected ? "Connected" : "Disconnected")")
                        .bold()
                }
                .padding()
                .background(section.isConnected ? LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3502247432, green: 0.5155714897, blue: 0.7318867723, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                        .foregroundColor(section.isConnected ? Color(#colorLiteral(red: 0.6746575342, green: 0.8423587329, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                )
                    .shadow(color: section.isConnected ? Color(#colorLiteral(red: 0.5771618151, green: 0.7418664384, blue: 1, alpha: 1)).opacity(0.15) : Color.clear, radius: 12, x: -12, y: -12)
                    .shadow(color: Color.black.opacity(0.4), radius: 12, x: 12, y: 12)
            }
            .frame(width: screen.width / 1.4, height: screen.width * 1.1)
            .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 12, y: 12)
        }
    }
}

struct AddSpeakerButton: View {
    var body: some View {
            Button(action: {
                print("add speaker")
            }) {
                HStack {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                    Image(systemName: "hifispeaker")
                        .resizable()
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
                .frame(width: 125, height: 100)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                    .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                )
                .shadow(color: Color.black.opacity(0.2), radius: 12, x: 12, y: 12)
                .shadow(color: Color.gray.opacity(0.1), radius: 12, x: -8, y: -8)
            }
        }
}

struct SpeakerSection: Identifiable {
    var id = UUID()
    var isOn: Bool
    var title: String
    var isConnected: Bool
}

let sectionData = [SpeakerSection(isOn: true, title: "Kitchen", isConnected: true),
SpeakerSection(isOn: false, title: "Bedroom", isConnected: false),
SpeakerSection(isOn: true, title: "Living Room", isConnected: true)]
