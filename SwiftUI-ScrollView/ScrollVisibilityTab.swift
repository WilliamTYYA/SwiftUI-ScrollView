//
//  ScrollVisibilityTab.swift
//  SwiftUI-ScrollView
//
//  Created by Thiha Ye Yint Aung on 2/8/26.
//

import SwiftUI

struct ScrollVisibilityTab: View {
    @State private var lastVisibleColor: Color?
    @State private var visibleColors: [Color] = []
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(AppData.myColors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(color)
                            .frame(height: 300)
                            .overlay {
                                Text(String(describing: color))
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                                    .scaleEffect(lastVisibleColor == color ? 3.5 : 1.0)
                            }
                            .rotationEffect(visibleColors.contains(color) ? Angle.zero : Angle(degrees: 30))
                            .opacity(visibleColors.contains(color) ? 1 : 0.3)
                            .animation(.default, value: lastVisibleColor)
                            .animation(.default, value: visibleColors)
                            .onScrollVisibilityChange { isVisible in
                                if isVisible {
                                    lastVisibleColor = color
                                }
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .onScrollTargetVisibilityChange(idType: Color.self, { colors in
                self.visibleColors = colors
            })
            .padding()
            .navigationTitle("Scroll Visibility")
        }
    }
}

#Preview {
    ScrollVisibilityTab()
}
