//
//  BannerCatalogView.swift
//  SaryApp
//
//  Created by Musab Aljarba on 09/02/1443 AH.
//

import SwiftUI
import SDWebImageSwiftUI

struct BannerCatalogView: View {
    @ObservedObject private var catalogViewModel = CatalogViewModel()
    
    private var columns: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.size.width / 2.1)),
        GridItem(.fixed(UIScreen.main.bounds.size.width / 2.1))
    ]
    
    var body: some View {
        LazyVGrid(
            columns: columns,
            alignment: .center
        ) {
            ForEach(catalogViewModel.bannerCatalogs.data, id: \.self) { bannerCatalog in
                NavigationLink(
                    destination: CatalogNavigationView(imageURL: bannerCatalog.image),
                    label: {
                        WebImage(url: URL(string: bannerCatalog.image))
                            .resizable()
                            .scaledToFill()
                    })
                
            }
        }
    }
}

struct BannerCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        BannerCatalogView()
    }
}
