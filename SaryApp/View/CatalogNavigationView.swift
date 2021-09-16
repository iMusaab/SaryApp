//
//  CatalogNavigationView.swift
//  SaryApp
//
//  Created by Musab Aljarba on 09/02/1443 AH.
//

import SwiftUI
import SDWebImageSwiftUI

struct CatalogNavigationView: View {
    var imageURL: String
    
    var body: some View {
        WebImage(url: URL(string: imageURL))
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200, alignment: .center)
    }
}

struct CatalogNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogNavigationView(imageURL: "https://devcdn.sary.co/layout_groups/2020/08/31/%D9%85%D9%80%D9%80%D8%B9%D9%80%D9%80%D9%80%D9%84%D8%A8%D8%A7%D8%AA.png").environment(\.layoutDirection, .rightToLeft)
    }
}
