//
//  ContentView.swift
//  SaryApp
//
//  Created by Musab Aljarba on 06/02/1443 AH.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: - This is the main view grouping all views in one page

struct ContentView: View {
    @ObservedObject private var bannerViewModel = BannerViewModel()
    @ObservedObject private var catalogViewModel = CatalogViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView(.vertical) {
                    VStack {
                        BannerView()
                            .padding(.vertical)
                        SmartCatalogView()
                            .padding(.vertical)
                        groupCatalogView()
                            .padding(.vertical)
                        BannerCatalogView()
                            .padding(.vertical)
                    }
                }
            }
            .navigationTitle(Text("ساري"))
            .onAppear {
                bannerViewModel.getBanners()
                catalogViewModel.getCatalogs()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
                ContentView().environment(\.layoutDirection, .rightToLeft)
    }
}


