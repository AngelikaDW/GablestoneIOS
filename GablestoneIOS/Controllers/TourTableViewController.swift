//
//  TourTableViewController.swift
//  GablestoneIOS
//
//  Created by AngelikaDW on 19/04/2018.
//  Copyright © 2018 aleaf. All rights reserved.
//

import UIKit
import RealmSwift

class TourTableViewController: UITableViewController {
    
    var realm: Realm!
    var stones: Results<Stone>?
    var selectedTourNumber: Int?
    var selectedTour: Tour? {
        didSet{
            loadStones()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        tableView.rowHeight = 160
        print(selectedTourNumber)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        //Register the TourTableCell.xib file here:
        tableView.register(UINib(nibName:"TourTableViewCell", bundle: nil), forCellReuseIdentifier: "StoneCell")
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Set the title in the nav bar
        title = selectedTour?.tourName
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

         return stones?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoneCell", for: indexPath) as! TourTableViewCell
        
        if let stone = stones?[indexPath.row] {
            cell.stoneName.text = stone.name
            cell.stoneAddress.text = stone.address
            cell.stoneImage.image = UIImage(named: "img\(selectedTourNumber!)_\(stone.runningNumber)")
        } else {
            cell.stoneName.text = "No stones in the database"
        }
        return cell
    }

    
    // MARK - Model Manipulation Method
    func loadStones(){
        
        stones = selectedTour?.stones.sorted(byKeyPath: "runningNumber", ascending: true)
        
        tableView.reloadData()
    }
    
    
}
