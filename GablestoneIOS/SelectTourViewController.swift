//
//  ViewController.swift
//  GablestoneIOS
//
//  Created by AngelikaDW on 19/04/2018.
//  Copyright © 2018 aleaf. All rights reserved.
//

import UIKit

class SelectTourViewController: UIViewController {
    
    var selectedTour: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tourButtonPressed(_ sender: UIButton) {
        selectedTour = sender.tag
        
        performSegue(withIdentifier: "tourButtonPressed", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tourButtonPressed" {
            let destinationVC = segue.destination as! TourTableViewController
            destinationVC.selectedTour = selectedTour!
        }
    }
    

}

