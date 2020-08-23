//
//  UserStore.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/16/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

class UserStore: ObservableObject {
    @Published var isLogged = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet {
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }
    }
}


