//
//  ContentView.swift
//  SaryApp
//
//  Created by Musab Aljarba on 06/02/1443 AH.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var bannerViewModel = BannerViewModel()
    
    var body: some View {
        ForEach(bannerViewModel.banners, id: \.self) { banner in
            Text("\(banner.id)")
        }
            .padding()
            .onAppear {
                bannerViewModel.getBanners()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
