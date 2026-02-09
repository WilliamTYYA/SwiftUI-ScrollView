//
//  CarouselView.swift
//  SwiftUI-ScrollView
//
//  Created by Thiha Ye Yint Aung on 2/9/26.
//

import SwiftUI

//struct CarouselView: View {
//    @State private var imagesOnScreen: [CarouselImage.ID] = []
//    @State private var scrollPosition = ScrollPosition()
//    var body: some View {
//        VStack{
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing:0) {
//                    ForEach(AppData.myImages) { carouselImage in
//                        VStack {
//                            Image(carouselImage.imageName)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(maxWidth: .infinity)
//                                .clipShape(RoundedRectangle(cornerRadius: 20))
//                                .shadow(radius: 10)
//                                .padding()
//                            Text(carouselImage.imageTitle)
//                        }
//                        .id(carouselImage)
//                    }
//                    .containerRelativeFrame(.horizontal)
//                }
//                .scrollTargetLayout()
//            }
//            HStack {
//                ForEach(AppData.myImages) { image in
//                    Circle()
//                        .fill(imagesOnScreen.contains(image.id) ? .secondary : .primary)
//                        .frame(width: imagesOnScreen.contains(image.id) ? 20 : 10)
//                        .onTapGesture {
//                            withAnimation {
//                                scrollPosition.scrollTo(id: image.id)
//                            }
//                        }
//                }
//            }
//            .padding(5)
//            .background(.thickMaterial, in: Capsule())
//            .animation(.default, value: imagesOnScreen)
//        }
//        .scrollPosition($scrollPosition)
//        .scrollTargetBehavior(.paging)
//        .onScrollTargetVisibilityChange(idType: CarouselImage.ID.self) { carouselImages in
//            imagesOnScreen = carouselImages
//            print(imagesOnScreen)
//        }
//    }
//}

struct CarouselView: View {
    @State private var imageOnScreen: [CarouselImage.ID] = []
    @State private var scrollPosition = ScrollPosition()
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(AppData.myImages) { carouselImage in
                        VStack {
                            Image(carouselImage.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 10)
                                .padding()
                            Text(carouselImage.imageTitle)
                        }
                        .id(carouselImage.id)
                    }
                    .containerRelativeFrame(.horizontal)
                }
                .scrollTargetLayout()
            }
            .scrollPosition($scrollPosition)
            .scrollTargetBehavior(.paging)
            .onScrollTargetVisibilityChange(idType: CarouselImage.ID.self) { carouselImages in
                imageOnScreen = carouselImages
            }
            
            HStack {
                ForEach(AppData.myImages) { image in
                    Circle()
                        .fill(imageOnScreen.contains(image.id) ? .secondary : .primary)
                        .frame(width: imageOnScreen.contains(image.id) ? 20 : 10)
                        .onTapGesture {
                            withAnimation {
                                scrollPosition.scrollTo(id: image.id)
                            }
                        }
                }
            }
            .padding(5)
            .background(.thickMaterial, in: Capsule())
            .animation(.default, value: imageOnScreen)
        }
    }
}

#Preview {
    CarouselView()
}
