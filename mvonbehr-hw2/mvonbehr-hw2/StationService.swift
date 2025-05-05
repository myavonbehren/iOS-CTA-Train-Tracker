//
//  StationService.swift
//  mvonbehr-hw2
//
//  Created by Mya Von Behren on 5/5/25.
//

import Foundation

class StationService {
    
    let feed = "http://data.cityofchicago.org/resource/8pix-ypme.json"
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String,Any)
    }
    
    func fetchRedLineStations(completion: @escaping ([Station]) -> Void) {
        guard let feedURL = URL(string: feed) else {return }
        
        let request = URLRequest(url: feedURL)
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let data = data else { return }
            debugPrint(data)
            
        }
        
        
    }

}
