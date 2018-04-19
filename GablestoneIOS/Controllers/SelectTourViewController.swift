//
//  ViewController.swift
//  GablestoneIOS
//
//  Created by AngelikaDW on 19/04/2018.
//  Copyright © 2018 aleaf. All rights reserved.
//

import UIKit
import RealmSwift

class SelectTourViewController: UIViewController {
    var realm: Realm!
    
    var tours: Results<Tour>?
    
    var selectedTour: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         realm = try! Realm()
        
        loadTours()
//Initially create entries into the realm DB
//        do {
//            try realm.write {
//                let newTour = Tour()
//                newTour.tourName = "Old Center"
//                newTour.tourNumber = 2
//                realm.add(newTour)
//            }
//        } catch {
//            print("error saving tour \(error)")
//        }
    
    }
    
    func loadTours() {
        tours = realm.objects(Tour.self)
    }
    
    

    @IBAction func tourButtonPressed(_ sender: UIButton) {
        selectedTour = sender.tag
        
        performSegue(withIdentifier: "tourButtonPressed", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tourButtonPressed" {
            let destinationVC = segue.destination as! TourTableViewController
            destinationVC.selectedTour = tours?[selectedTour!-1]
        }
    }
    

}

