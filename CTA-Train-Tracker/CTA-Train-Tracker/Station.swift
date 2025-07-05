//
//  Station.swift
//  CTA-Train-Tracker
//
//  Created by Mya Von Behren on 5/5/25.
//

import Foundation

// Make custom data types compatible with JSON
struct Station: Codable {
    var stationName: String
    var mapID: String
    var isRed: Bool
    
    // Map between Swift property and JSON field name
    enum CodingKeys: String, CodingKey {
        case stationName = "station_name"
        case mapID = "map_id"
        case isRed = "red"
    }
}
