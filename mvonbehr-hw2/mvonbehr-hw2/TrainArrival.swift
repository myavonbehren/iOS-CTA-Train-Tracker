//
//  TrainArrival.swift
//  mvonbehr-hw2
//
//  Created by Mya Von Behren on 5/5/25.
//

import Foundation

// Nested JSON file

struct CTAResponse: Codable {
    let cttatt: CTATrainTracker
}

struct CTATrainTracker: Codable {
    let eta: [CTATrain]
}

struct CTATrain: Codable {
    let staId: String
    let staNm: String
    let destNm: String
    let arrT: String
    
    
    
}



/*
 
 "arrT": "2025-05-05T18:28:27"
 */


