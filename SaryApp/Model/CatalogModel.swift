//
//  CatalogModel.swift
//  SaryApp
//
//  Created by Musab Aljarba on 08/02/1443 AH.
//

import Foundation

// MARK: - Catalog
struct Catalog: Codable {
    let result: [CatalogResult]
    let other: Other
    let message: String
    let status: Bool
}

// MARK: - Other
struct Other: Codable {
    let showSpecialOrderView: Bool
    let uncompletedProfileSettings: UncompletedProfileSettings
    let businessStatus: BusinessStatus

    enum CodingKeys: String, CodingKey {
        case showSpecialOrderView = "show_special_order_view"
        case uncompletedProfileSettings = "uncompleted_profile_settings"
        case businessStatus = "business_status"
    }
}

// MARK: - BusinessStatus
struct BusinessStatus: Codable {
    let id: Int
    let title: String
}

// MARK: - UncompletedProfileSettings
struct UncompletedProfileSettings: Codable {
    let showTag: Bool
    let message: String
    let image: String
    let isCompletedProfile: Bool

    enum CodingKeys: String, CodingKey {
        case showTag = "show_tag"
        case message, image
        case isCompletedProfile = "is_completed_profile"
    }
}

// MARK: - CatalogResult
struct CatalogResult: Codable {
    let id: Int
    let title: String
    let data: [Datum]
    let dataType: String
    let showTitle: Bool
    let uiType: String
    let rowCount: Int

    enum CodingKeys: String, CodingKey {
        case id, title, data
        case dataType = "data_type"
        case showTitle = "show_title"
        case uiType = "ui_type"
        case rowCount = "row_count"
    }
}

// MARK: - Datum
struct Datum: Codable {
    
    let groupID: Int?
    let filters: [Filter]?
    let name: String?
    let image: String 
    let emptyContentImage: String?
    let emptyContentMessage: String?
    let hasData, showUnavailableItems, showInBrochureLink: Bool?
    let deepLink: String?

    enum CodingKeys: String, CodingKey {
        case groupID = "group_id"
        case filters, name, image
        case emptyContentImage = "empty_content_image"
        case emptyContentMessage = "empty_content_message"
        case hasData = "has_data"
        case showUnavailableItems = "show_unavailable_items"
        case showInBrochureLink = "show_in_brochure_link"
        case deepLink = "deep_link"
    }
}

// MARK: - Filter
struct Filter: Codable {
    let filterID: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case filterID = "filter_id"
        case name
    }
}
