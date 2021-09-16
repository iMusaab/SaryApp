//
//  SmartCatalogView.swift
//  SaryApp
//
//  Created by Musab Aljarba on 09/02/1443 AH.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: - This view is for the Smart Catalogs first level

struct SmartCatalogView: View {
    @ObservedObject private var catalogViewModel = CatalogViewModel()
    
    let layout = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(catalogViewModel.smartCatalogs.data, id: \.self) { smartcatalog in
                    VStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            WebImage(url: URL(string: smartcatalog.image))
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.size.width / 20)
                                .padding(20)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color(#colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.05882352941, alpha: 1)).opacity(0.1), radius: 10, x: 0, y: 6)
                        })
                        
                        Text(smartcatalog.name)
                            .font(.caption)
                    }
                }
            }
            .padding(.horizontal, 20)
        .onAppear {
            catalogViewModel.getCatalogs()
        }
    }
}

struct SmartCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        SmartCatalogView().environment(\.layoutDirection, .rightToLeft)
    }
}
