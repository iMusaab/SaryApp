//
//  File.swift
//  SaryApp
//
//  Created by Musab Aljarba on 06/02/1443 AH.
//

import Foundation
import Alamofire

// MARK: - BannerModel
struct BannerModel: Codable  {
    
    let result: [BannerResult]
    let status: Bool
}

// MARK: - Result
struct BannerResult: Codable, Identifiable, Hashable {
    let id: Int
    let title, description, button_text: String
    let expiry_status: Bool
    let created_at, start_date, expiry_date: String
    let image: String
    let priority: Int
    let photo: String
    let link, level: String
    let is_available: Bool
    let branch: Int

//    enum CodingKeys: String, CodingKey {
//        case id, title
//        case resultDescription = "description"
//        case buttonText = "button_text"
//        case expiryStatus = "expiry_status"
//        case createdAt = "created_at"
//        case startDate = "start_date"
//        case expiryDate = "expiry_date"
//        case image, priority, photo, link, level
//        case isAvailable = "is_available"
//        case branch
//    }
}

class Api : ObservableObject{
    @Published var bannerModel = BannerModel.self
    
    func loadData(completion:@escaping (BannerModel) -> ()) {
        guard let url = URL(string: "https://staging.sary.co/api/v2.5.1/baskets/76097/banners/") else {
            print("Invalid url...")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("android", forHTTPHeaderField: "Device-Type")
        request.addValue("3.1.1.0.0", forHTTPHeaderField: "App-Version")
        request.addValue("ar", forHTTPHeaderField: "Accept-Language")
        request.addValue("token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6ODg2NiwidXNlcl9waG9uZSI6Ijk2NjU2NDk4OTI1MCJ9.VYE28vtnMRLmwBISgvvnhOmPuGueW49ogOhXm5ZqsGU", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
           
            if let data = data {
                print(data)
                if let response = try? JSONDecoder().decode(BannerModel.self, from: data) {
                    print(response)
                    DispatchQueue.main.async {
                        completion(response)
                    }
                    return
                }
            }
                if let error = error {
                    print("Error in api: \(error)")
                } else {
                    print("error")
                }
        }.resume()
        
    }
}

class Api2 : ObservableObject{
    @Published var bannerModel = BannerModel.self
    
    func loadData(completion:@escaping (BannerModel) -> ()) {
        
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
