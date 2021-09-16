//
//  ContentView.swift
//  SaryApp
//
//  Created by Musab Aljarba on 06/02/1443 AH.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
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
                    }
                }
            }
            .navigationTitle(Text("ساري"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
                ContentView()
    }
}


