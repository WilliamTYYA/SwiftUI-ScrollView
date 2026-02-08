//
//  StartView.swift
//  SwiftUI-iOS18-ScrollView
//
//  Created by Thiha Ye Yint Aung on 2/7/26.
//

import SwiftUI

struct StartTabView: View {
    var body: some View {
        TabView {
            Tab("Position", systemImage: "1.circle.fill") {
                ScrollPositionTabView()
            }
            
            Tab("Position", systemImage: "2.circle.fill") {
                Text("Hello")
            }
        }
    }
}

#Preview {
    StartTabView()
}
