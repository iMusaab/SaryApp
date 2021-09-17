//
//  BannerCatalogView.swift
//  SaryApp
//
//  Created by Musab Aljarba on 09/02/1443 AH.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: - This view is for the Banner Catalogs third level

struct BannerCatalogView: View {
    @ObservedObject private var catalogViewModel = CatalogViewModel()
    
    private var layout: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.size.width / 5))
//        GridItem(.fixed(UIScreen.main.bounds.size.width / 4.4)),
//        GridItem(.fixed(UIScreen.main.bounds.size.width / 4.4))
    ]
    
    var body: some View {
        VStack {
            if catalogViewModel.bannerCatalogs.showTitle {
                HStack {
                    Text(catalogViewModel.bannerCatalogs.title)
                        .font(.title)
                        .padding()
                    Spacer()
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack() {
                    ForEach(catalogViewModel.bannerCatalogs.data, id: \.self) { bannerCatalog in
                        NavigationLink(
                            destination: CatalogNavigationView(imageURL: bannerCatalog.image),
                            label: {
                                WebImage(url: URL(string: bannerCatalog.image))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.size.width / 5, height: UIScreen.main.bounds.size.width / 5)
                                    .rotation3DEffect(Angle(degrees: 180), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                            }).padding(.horizontal, 5)
                    }
                }
            }
            
            .frame(height: UIScreen.main.bounds.size.width / 4, alignment: .center)
            .flipsForRightToLeftLayoutDirection(true)
        }
        .onAppear {
            catalogViewModel.getCatalogs()
        }
    }
}

struct BannerCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        BannerCatalogView()
    }
}
