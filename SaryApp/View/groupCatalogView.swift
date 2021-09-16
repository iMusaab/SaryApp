//
//  groupCatalogView.swift
//  SaryApp
//
//  Created by Musab Aljarba on 09/02/1443 AH.
//

import SwiftUI
import SDWebImageSwiftUI

struct groupCatalogView: View {
    @ObservedObject private var catalogViewModel = CatalogViewModel()
    
    private var columns: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.size.width / 2.1)),
        GridItem(.fixed(UIScreen.main.bounds.size.width / 2.1))
    ]
    
    var body: some View {
        
        
        VStack(alignment: .center) {
            if catalogViewModel.groupCatalogs.showTitle {
                HStack {
                    Spacer()
                    Text(catalogViewModel.groupCatalogs.title)
                        .font(.title)
                        .padding()
                }
            }
            LazyVGrid(
                    columns: columns,
                    alignment: .center
                ) {
                    ForEach(catalogViewModel.groupCatalogs.data, id: \.self) { gropCatalog in
                        NavigationLink(
                            destination: CatalogNavigationView(imageURL: gropCatalog.image),
                            label: {
                                WebImage(url: URL(string: gropCatalog.image))
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

struct groupCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        groupCatalogView()
    }
}
