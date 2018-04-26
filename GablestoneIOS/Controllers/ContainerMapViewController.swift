//
//  ContainerMapViewController.swift
//  GablestoneIOS
//
//  Created by AngelikaDW on 26/04/2018.
//  Copyright © 2018 aleaf. All rights reserved.
//

import UIKit
import RealmSwift

class ContainerMapViewController: UIViewController {
    var selectedTourNumber: Int?
    var selectedTour: Tour?
    var selectedStone: Stone?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ContainerMapVC TourNumber: \(selectedTourNumber)")
        //print("ContainerMapVC StoneSelected: \(selectedStone)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedMap" {
            let destinationVC = segue.destination as! MapViewController
            destinationVC.selectedTourNumber = selectedTourNumber
            destinationVC.selectedTour = selectedTour
            destinationVC.selectedStone = selectedStone
        }
    }
    


}
