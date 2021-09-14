//
//  ContentView.swift
//  SaryApp
//
//  Created by Musab Aljarba on 06/02/1443 AH.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject private var bannerViewModel = BannerViewModel()
    @State var selectedTab = 0
    @Binding var showToast: Bool
    
    var body: some View {
        GeometryReader { proxy in
        TabView {
            ForEach(0..<bannerViewModel.banners.count, id: \.self) { i in
                WebImage(url: URL(string: bannerViewModel.banners[i].image))
                    .resizable()
                    .scaledToFill()
                    .tag(i)
                    .onTapGesture {
                        
                    }
            }
        }.tabViewStyle(PageTabViewStyle())
        .frame(width: proxy.size.width - 30, height: proxy.size.height / 4, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.leading, 15)
//        .onChange(of: selectedTab) { newValue in
//                    model.myFunction(item: newValue)
//                }
        
            .onAppear {
                bannerViewModel.getBanners()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var showToast = false
    static var previews: some View {
        ContentView(showToast: $showToast)
    }
}
