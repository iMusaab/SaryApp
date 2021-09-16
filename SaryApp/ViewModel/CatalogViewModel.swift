//
//  CatalogViewModel.swift
//  SaryApp
//
//  Created by Musab Aljarba on 09/02/1443 AH.
//

import Foundation

struct CatalogDataViewModel: Hashable, Identifiable {
    let id = UUID()
    
    var name: String
    var image: String
}

struct CatalogResultViewModel {
    
    var id: Int = 0
    var title: String = ""
    var data: [CatalogDataViewModel] = []
    var dataType: String = ""
    var showTitle: Bool = false
    var uiType: String = ""
    var rowCount: Int = 1
}

class CatalogViewModel: ObservableObject {
    private var APIManager: Api = Api()
    
    @Published var smartCatalogsData: [CatalogDataViewModel] = []
    @Published var groupCatalogsData = [Datum]()
    @Published var bannerCatalogsData = [Datum]()
    
    @Published var smartCatalogs = CatalogResultViewModel()
    @Published var groupCatalogs = CatalogResultViewModel()
    @Published var bannerCatalogs = CatalogResultViewModel()
    
    func getCatalogs() {
        APIManager.loadCatalogData { result in
            switch result {
            case .success(let catalog):
                if let catalog = catalog {
                    self.filterCatalogResult(catalog: catalog)
//                    print(catalog.result)
                }
            case .failure(let error):
                print("Failed decoding catalog data: \(error)")
            }
        }
    }
    
    func filterCatalogResult(catalog: Catalog) {
        
        if let smartType = catalog.result.first(where: { $0.dataType == "smart" }) {
//            smartCatalogsData = smartType.data.map{ CatalogDataViewModel(name: $0.name ?? "", image: $0.image)}
            smartCatalogs = CatalogResultViewModel(id: smartType.id, title: smartType.title, data: smartType.data.map{ CatalogDataViewModel(name: $0.name ?? "", image: $0.image)}, dataType: smartType.dataType, showTitle: smartType.showTitle, uiType: smartType.uiType, rowCount: smartType.rowCount)
        } else {
            print("error assigning smartType")
        }
        
        if let groupType = catalog.result.first(where: { $0.title == "الاقسام" }) {
            
            groupCatalogs = CatalogResultViewModel(id: groupType.id, title: groupType.title, data: groupType.data.map{ CatalogDataViewModel(name: $0.name ?? "", image: $0.image)}, dataType: groupType.dataType, showTitle: groupType.showTitle, uiType: groupType.uiType, rowCount: groupType.rowCount)
        } else {
            print("error assigning groupType")
        }
        
        if let bannerType = catalog.result.first(where: { $0.dataType == "banner" }) {
            bannerCatalogs = CatalogResultViewModel(id: bannerType.id, title: bannerType.title, data: bannerType.data.map{ CatalogDataViewModel(name: $0.name ?? "", image: $0.image)}, dataType: bannerType.dataType, showTitle: bannerType.showTitle, uiType: bannerType.uiType, rowCount: bannerType.rowCount)
        }
        print(bannerCatalogs)
        
//        for catalogResult in catalog.result {
//            if catalogResult.dataType.contains("smart") {&& $0.title == "الاقسام"
//                smartCatalogsData = catalogResult.data $0.dataType == "group" && $0.id == 9
//            }
//            if catalogResult.dataType.contains("group") && catalogResult.title == "الأقسام"{
//                groupCatalogsData = catalogResult.data
//            }
//            if catalogResult.dataType.contains("banner") {
//                bannerCatalogsData = catalogResult.data
//            }
//        }
        
//        smartCatalogs = catalog.result.filter({ result in
//            return result.dataType.contains("smart")
//        })
//        print(smartCatalogs)
//
//        groupCatalogs = catalog.result.filter({ result in
//            return result.dataType.contains("group")
//        })
////        print(groupCatalogs)
//        bannerCatalogs = catalog.result.filter({ result in
//            return result.dataType.contains("banner")
//        })
        
    }
}


