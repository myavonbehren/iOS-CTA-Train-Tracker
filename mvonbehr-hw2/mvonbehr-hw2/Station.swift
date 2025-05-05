//
//  Station.swift
//  mvonbehr-hw2
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

/*
 https://developer.apple.com/documentation/foundation/encoding-and-decoding-custom-types
 
 "stop_id": "30162",
     "direction_id": "W",
     "stop_name": "18th (54th/Cermak-bound)",
     "station_name": "18th",
     "station_descriptive_name": "18th (Pink Line)",
     "map_id": "40830",
     "ada": true,
     "red": false,
     "blue": false,
     "g": false,
     "brn": false,
     "p": false,
     "pexp": false,
     "y": false,
     "pnk": true,
     "o": false,
     "location": {
       "latitude": "41.857908",
       "longitude": "-87.669147",
       "human_address": "{\"address\": \"\", \"city\": \"\", \"state\": \"\", \"zip\": \"\"}"
     },
     ":@computed_region_awaf_s7ux": "8",
     ":@computed_region_6mkv_f3dw": "14920",
     ":@computed_region_vrxf_vc4k": "33",
     ":@computed_region_bdys_3d7i": "343",
     ":@computed_region_43wa_7qmu": "26"
 */
