//
//  Station.swift
//  mvonbehr-hw2
//
//  Created by Mya Von Behren on 5/5/25.
//

import Foundation

struct Station {
    let stationName: String
    let mapID: String
    let isRed: Bool
    
    var displayName: String {
        return stationName
    }
}

/*
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
