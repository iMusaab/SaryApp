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
        GridItem(.fixed(UIScreen.main.bounds.size.width / 4.4)),
        GridItem(.fixed(UIScreen.main.bounds.size.width / 4.4)),
        GridItem(.fixed(UIScreen.main.bounds.size.width / 4.4)),
        GridItem(.fixed(UIScreen.main.bounds.size.width / 4.4))
    ]
    
    var body: some View {
        VStack {
            if catalogViewModel.bannerCatalogs.showTitle {
                HStack {
                    Spacer()
                    Text(catalogViewModel.bannerCatalogs.title)
                        .font(.title)
                        .padding()
                }
            }
            
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
            .onAppear {
                catalogViewModel.getCatalogs()
        }
        }
    }
}

struct BannerCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        BannerCatalogView()
    }
}
