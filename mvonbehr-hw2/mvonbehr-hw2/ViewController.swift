//
//  ViewController.swift
//  mvonbehr-hw2
//
//  Created by Mya Von Behren on 5/4/25.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    // API KEY 291d33ffcb8f401c8c41d051e6d873da
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let service = StationService()
            service.fetchRedLineStations { stations in
                print("Got \(stations.count) stations")
            }    }
    
   
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Searching for: \(searchText)")
    }
    
    func testStationService() {
        let stationService = StationService()
        
        print("Testing station service...")
        stationService.fetchRedLineStations { stations in            
            for (index, station) in stations.enumerated() {
                print("  \(index + 1). \(station.stationName)")
            }
    
        }
    }
    
    /*
     https://data.cityofchicago.org/resource/8pix-ypme.json
     */
    
}

