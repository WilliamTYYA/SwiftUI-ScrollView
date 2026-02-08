//
//  ScrollGeometryChangeTab.swift
//  SwiftUI-ScrollView
//
//  Created by Thiha Ye Yint Aung on 2/8/26.
//

import SwiftUI

struct ScrollData: Equatable {
    let bounds: CGRect
    let containerSize: CGSize
    let contentInsets: EdgeInsets
    let contentOffset: CGPoint
    let contentSize: CGSize
    let visibleRect: CGRect
    init(
        bounds: CGRect = .zero,
        containerSize: CGSize = .zero,
        contentInsets: EdgeInsets = .init(),
        contentOffset: CGPoint = .zero,
        contentSize: CGSize = .zero,
        visibleRect: CGRect = .zero
    ) {
        self.bounds = bounds
        self.containerSize = containerSize
        self.contentInsets = contentInsets
        self.contentOffset = contentOffset
        self.contentSize = contentSize
        self.visibleRect = visibleRect
    }
}

struct ScrollGeometryChangeTab: View {
    @State private var scrollData = ScrollData()
    var body: some View {
        NavigationStack {
            Text("\(scrollData.contentSize.width)")
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(AppData.myColors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(color)
                            .frame(height: 300)
                            .overlay {
                                Text(String(describing: color))
                                    .font(.largeTitle)
                                    .foregroundStyle(Color.white)
                            }
                    }
                }
            }
            .onScrollGeometryChange(
                for: ScrollData.self,
                of: { geometry in
                    ScrollData(
                        bounds: geometry.bounds,
                        containerSize: geometry.containerSize,
                        contentInsets: geometry.contentInsets,
                        contentSize: geometry.contentSize,
                        visibleRect: geometry.visibleRect
                    )
                },
                action: { oldValue, newValue in
                    scrollData = newValue
                })
            .padding()
            .navigationTitle("ScrollGeometry")
        }
    }
}

#Preview {
    ScrollGeometryChangeTab()
}
