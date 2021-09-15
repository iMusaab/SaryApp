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
       BannerView()
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var showToast = false
    static var previews: some View {
        ContentView()
    }
}


