//
//  APIManager.swift
//  SaryApp
//
//  Created by Musab Aljarba on 06/02/1443 AH.
//

import Foundation
import Alamofire

public class BannerJSON {
    @Published var banners = [BannerResult]()
    
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

class CatalogApi : ObservableObject{
    @Published var bannerModel = BannerModel.self
    
    func loadData(completion:@escaping (BannerModel) -> ()) {
        
        let url = "https://staging.sary.co/api/baskets/76097/catalog/"
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

// This class returned empty values for result
class BannerAPI : ObservableObject{
    @Published var bannerModel = BannerModel.self
    
    func loadData(completion:@escaping (BannerModel) -> ()) {
        
        let url = "https://staging.sary.co/api/baskets/76097/catalog/"
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
