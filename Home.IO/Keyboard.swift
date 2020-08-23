//
//  KeyboardGuardian.swift
//  Home.IO
//
//This code is from StackOverflow
//Credit goes to @KeyboardGuardian on StackOverflow
//Used to slide text fields according to keyboard movements

import SwiftUI
import Combine

struct Keyboard: ViewModifier {
    @State var offset: CGFloat = 0
    
    func body(content: Content) -> some View {
        content.padding(.bottom, offset).onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                self.offset = value.height
            }
        
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
                self.offset = 0
            }
        }
    }
}
