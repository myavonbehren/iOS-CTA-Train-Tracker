//
//  ViewController.swift
//  mvonbehr-hw2
//
//  Created by Mya Von Behren on 5/4/25.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet var trainLines: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func trainLineSelected(_ sender: UIButton) {
        for button in trainLines {
            button.isSelected = false
        }
    
        sender.isSelected = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Searching for: \(searchText)")
    }
    
    /*
     https://data.cityofchicago.org/resource/8pix-ypme.json
     */
    
}

