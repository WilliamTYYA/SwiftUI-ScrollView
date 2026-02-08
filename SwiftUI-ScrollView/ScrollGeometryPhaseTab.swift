//
//  ScrollGeometryPhaseTab.swift
//  SwiftUI-ScrollView
//
//  Created by Thiha Ye Yint Aung on 2/8/26.
//

import SwiftUI

struct ScrollGeometryPhaseTab: View {
    @State private var scrollPhase: ScrollPhase = .idle
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
                            }
//                            .opacity(scrollPhase == .idle ? 1.0 : 0.5)
                            .opacity(!scrollPhase.isScrolling ? 1.0 : 0.5)
                    }
                }
            }
            .animation(.default, value: scrollPhase)
            .onScrollPhaseChange { oldPhase, newPhase, context in
                scrollPhase = newPhase
                print(context.geometry)
                if let dy = context.velocity?.dy {
                    print(dy)
                }
            }
            .padding()
            .navigationTitle("Scroll Phase")
        }
    }
}

#Preview {
    ScrollGeometryPhaseTab()
}
