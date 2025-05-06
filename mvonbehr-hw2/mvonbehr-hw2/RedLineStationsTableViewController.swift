//
//  RedLineStationsTableViewController.swift
//  mvonbehr-hw2
//
//  Created by Mya Von Behren on 5/5/25.
//

import UIKit

class RedLineStationsTableViewController: UITableViewController {
    
    var stations: [Station] = []
    let service = StationService()
    var isLoading = true
    
    // API KEY 291d33ffcb8f401c8c41d051e6d873da
    // https://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=291d33ffcb8f401c8c41d051e6d873da&max=1&mapid=41450&outputType=JSON
    // 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchStations()
        
        debugPrint(calculateMinutesToArrival(arrivalTime: "2025-05-05T18:28:27") ?? "no date :(")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    func calculateMinutesToArrival(arrivalTime: String) -> Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let arrivalDate = dateFormatter.date(from: arrivalTime) else { return 0 }
        let calendar = Calendar.current
        let timeComponents = calendar.dateComponents([.hour, .minute], from: arrivalDate)
        let nowComponents = calendar.dateComponents([.hour, .minute], from: Date())
        let difference = calendar.dateComponents([.minute], from: timeComponents, to: nowComponents).minute!
        return difference
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return isLoading ? 33 : stations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (isLoading) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceholderCell", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "station", for: indexPath)
            if indexPath.row < stations.count {
                let station = stations[indexPath.row]
                cell.textLabel?.text = station.stationName
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceholderCell", for: indexPath)
                return cell
            }
            return cell;
        }
    }
    
    
    // Using fetchRedLineStations method from StationService class
    // Gets station name
    func fetchStations(){
        isLoading = true
        tableView.reloadData()
        
        service.fetchRedLineStations { [weak self] stations in
            guard let self = self else { return }
            
            if !stations.isEmpty {
                self.stations = stations
                self.isLoading = false
                self.tableView.reloadData()
            } else {
                debugPrint("No stations")
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
