//
//  CatalogViewModel.swift
//  SaryApp
//
//  Created by Musab Aljarba on 09/02/1443 AH.
//

import Foundation

class CatalogViewModel: ObservableObject {
    private var APIManager: Api = Api()
    
    @Published var smartCatalogs = [CatalogResult]()
    @Published var groupCatalogs = [CatalogResult]()
    @Published var bannerCatalogs = [CatalogResult]()
    
    func getCatalogs() {
        APIManager.loadCatalogData { result in
            switch result {
            case .success(let catalog):
                if let catalog = catalog {
                    self.filterCatalogResult(catalog: catalog)
                    print(catalog.result)
                }
            case .failure(let error):
                print("Failed decoding: \(error)")
            }
        }
    }
    
    func filterCatalogResult(catalog: Catalog) {
        
        smartCatalogs = catalog.result.filter({ result in
            return result.dataType.contains("smart")
        })
        
        groupCatalogs = catalog.result.filter({ result in
            return result.dataType.contains("group")
        })
//        print(groupCatalogs)
        bannerCatalogs = catalog.result.filter({ result in
            return result.dataType.contains("banner")
        })
    }
}


