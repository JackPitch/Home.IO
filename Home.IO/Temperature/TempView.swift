//
//  TempView.swift
//  Home.IO
//
//  Created by Jackson Pitcher on 5/14/20.
//  Copyright © 2020 Jackson Pitcher. All rights reserved.
//

import SwiftUI

struct TempView: View {
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            TemperatureView()
            TurnOnButton()
        }
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
