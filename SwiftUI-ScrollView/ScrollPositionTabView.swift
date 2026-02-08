//
//  ScrollPositionTabView.swift
//  SwiftUI-iOS18-ScrollView
//
//  Created by Thiha Ye Yint Aung on 2/7/26.
//

import SwiftUI

struct ScrollPositionTabView: View {
    @State private var colorIndex = 0
    @State private var scrollPosition = ScrollPosition()
    
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
                    }
                }
            }
            .scrollPosition($scrollPosition)
            .animation(.default, value: scrollPosition)
            .padding()
            .navigationTitle("ScrollPosition")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button("Top Scroll Position", systemImage: "arrowshape.up.fill") {
                            scrollPosition.scrollTo(edge: .top)
                        }
                        
                        Button("Random Scroll Position", systemImage: "questionmark.square.fill") {
                            if let randomColor = AppData.myColors.randomElement() {
                                scrollPosition.scrollTo(id: randomColor)
                                print(String(describing: randomColor))
                            }
                        }
                        
                        Button("Bottom Scroll Position", systemImage: "arrowshape.down.fill") {
                            scrollPosition.scrollTo(edge: .bottom)
                        }
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Picker(selection: $colorIndex) {
                        ForEach(AppData.myColors.indices, id: \.self) { index in
                            Text("\(index)").tag(index)
                        }
                    } label: {
                        Text("")
                    }
                    .labelsHidden()
                    .onChange(of: colorIndex) {
                        scrollPosition.scrollTo(y: CGFloat(colorIndex * 310))
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollPositionTabView()
}
