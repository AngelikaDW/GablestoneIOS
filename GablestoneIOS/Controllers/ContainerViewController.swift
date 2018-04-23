//
//  ContainerViewController.swift
//  GablestoneIOS
//
//  Created by AngelikaDW on 20/04/2018.
//  Copyright © 2018 aleaf. All rights reserved.
//

import UIKit
import RealmSwift

class ContainerViewController: UIViewController {
    
    var selectedTourNumber: Int?
    var selectedTour: Tour?
    
    var embedVC = TourTableViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ContainerVC \(selectedTourNumber!)")
        print(selectedTour)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Set the title in the nav bar
        title = selectedTour?.tourName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTable" {
            let destinationVC = segue.destination as! TourTableViewController
            self.embedVC = destinationVC
            self.embedVC.selectedTourNumber = selectedTourNumber!
            self.embedVC.selectedTour = selectedTour
//            destinationVC.selectedTourNumber = selectedTourNumber!
        }
        
    }


    

}
