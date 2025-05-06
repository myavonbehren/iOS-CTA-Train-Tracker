//
//  StationService.swift
//  mvonbehr-hw2
//
//  Created by Mya Von Behren on 5/5/25.
//

import Foundation

class StationService {
    
    let feed = "https://data.cityofchicago.org/resource/8pix-ypme.json"
    
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
            
            guard let data = data else {
                print("No data")
                return
            }
            
            do {
                                   
                let stations = try JSONDecoder().decode([Station].self, from: data)
                
                guard !stations.isEmpty else {
                   throw SerializationError.missing("stations")
               }
                
                let redLineStations = self.removeDuplicates(from: stations)
                
                guard !redLineStations.isEmpty else {
                   throw SerializationError.missing("redLineStations")
               }
                
//                for station in redLineStations {
//                    debugPrint(station.stationName)
//                }
                
                DispatchQueue.main.async {
                    completion(redLineStations)
                }
            } catch _ as NSError {
                print("error")
                completion([])
            }
        }.resume()
    }
    
    // Original has 66 stations (duplicates)
    func removeDuplicates(from stations: [Station]) -> [Station] {
        let redLineStations = stations.filter { $0.isRed == true }
        var uniqueStations: [String: Station] = [:]
          
          for station in redLineStations {
              uniqueStations[station.stationName] = station
          }
          
        return Array(uniqueStations.values)
    }
}
