//
//  APIManager.swift
//  SaryApp
//
//  Created by Musab Aljarba on 06/02/1443 AH.
//

import Foundation
import Alamofire


// MARK: - The first API didn't return any data in result So I created this to read from the json response
public class BannerJSON {
    
    func loadData(completion: @escaping (Result<BannerModel?, Error>) -> Void) {
        
        if let fileLocation = Bundle.main.url(forResource: "JsonForBanner", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(BannerModel.self, from: data)
                
                completion(.success(dataFromJson))
                
            } catch {
                completion(.failure(error))
            }
        } else {
            print("Error locating json file")
        }
        
    }
}

// MARK: - This Class is created to read from the API .. for the banner the result was empty
class Api {
    
    func loadCatalogData(completion: @escaping (Result<Catalog?, Error>) -> Void) {
        
        let url = "https://staging.sary.co/api/baskets/76097/catalog/"
        let headers: HTTPHeaders = [
            "Device-Type": "android",
            "App-Version": "3.1.1.0.0",
            "Accept-Language": "ar",
            "Authorization": "token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6ODg2NiwidXNlcl9waG9uZSI6Ijk2NjU2NDk4OTI1MCJ9.VYE28vtnMRLmwBISgvvnhOmPuGueW49ogOhXm5ZqsGU"
        ]
        
        AF.request(url, method: .get, headers: headers) .responseDecodable(of: Catalog.self) { response in
//                        print(response)
                        switch response.result {
                        case .success(let catalog) :
                            completion(.success(catalog))
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
//            .responseJSON { response in
//            print(response)
//            switch response.result {
//
//            case .success(let result):
//                print(result)
//            case .failure(_):
//                print("error")
//            }
//        }
            
//
//        { response in
//
////            switch response.result {
////            case .success(let result):
////
////                let data = Data(data)
////
////                let catalog = JSONDecoder().decode(Catalog.self, from: data)
////            case .failure(_):
////                print("error")
////            }
//        }
        
    }
    
    // This function returned empty values from result
    func loadBannerData(completion:@escaping (BannerModel) -> ()) {
        
        let url = "https://staging.sary.co/api/v2.5.1/baskets/76097/banners/"
        let headers: HTTPHeaders = [
            "Device-Type": "android",
            "App-Version": "3.1.1.0.0",
            "Accept-Language": "ar",
            "Authorization": "token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6ODg2NiwidXNlcl9waG9uZSI6Ijk2NjU2NDk4OTI1MCJ9.VYE28vtnMRLmwBISgvvnhOmPuGueW49ogOhXm5ZqsGU"
        ]
        
        AF.request(url, method: .get, headers: headers).responseJSON { response in

            switch response.result {
            case .success(let value):
                print("\(value)")
                do {
                    let decoder = JSONDecoder()
//                    let data = try decoder.decode(BannerModel.self, from: value)
//                    print(data)
                } catch let error {
                    print(error)
                }
            case .failure(_):
                print("error")
            }
        }
        
    }
}
