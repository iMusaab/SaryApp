//
//  BannerViewModel.swift
//  SaryApp
//
//  Created by Musab Aljarba on 06/02/1443 AH.
//

import Foundation

class BannerViewModel: ObservableObject {
    private var jsonManager: BannerJSON = BannerJSON()
    @Published var banners = [BannerResult]()
    
    func getBanners() {
        jsonManager.loadData { result in
            switch result {
            case .success(let bannersfromJson):
                self.banners = bannersfromJson?.result ?? [BannerResult]()
                print("\(self.banners)")
                
            case .failure(let error):
                print("Error retriving data from JSON: \(error)")
            }
        }
    }
    
    
}


