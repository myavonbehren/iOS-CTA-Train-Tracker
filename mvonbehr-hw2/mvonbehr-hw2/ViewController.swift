//
//  ViewController.swift
//  mvonbehr-hw2
//
//  Created by Mya Von Behren on 5/4/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var popUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popUpButton.showsMenuAsPrimaryAction = true
        setupMenuActions()
    }
    
    func setupMenuActions() {
        guard let menu = popUpButton.menu else { return }
        debugPrint(menu)
    }

    
}

