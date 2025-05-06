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
    
    var arrivalMin: Int? {
        return calculateMinutesToArrival(arrivalTime: arrT)
    }
    
    var formattedArrivalTime: String {
        guard let arrivalMin = arrivalMin else {
            return "Due"
        }
        return "\(arrivalMin) minutes"
    }
    
    func calculateMinutesToArrival(arrivalTime: String) -> Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let arrivalDate = dateFormatter.date(from: arrivalTime) else { return 0 }
        let calendar = Calendar.current
        let timeComponents = calendar.dateComponents([.hour, .minute], from: arrivalDate)
        let nowComponents = calendar.dateComponents([.hour, .minute], from: Date())
        let difference = calendar.dateComponents([.minute], from: nowComponents , to: timeComponents).minute!
        return difference
    }
    
}


/*
 
 "arrT": "2025-05-05T18:28:27"
 */


