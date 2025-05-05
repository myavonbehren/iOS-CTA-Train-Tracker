//
//  ViewController.swift
//  mvonbehr-hw2
//
//  Created by Mya Von Behren on 5/4/25.
//

import UIKit


class TableViewController: UITableViewController, UISearchBarDelegate {
    
    var stations: [Station] = []
    let service = StationService()
    
    
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
    
    
    
}

