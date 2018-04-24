//
//  DetailViewController.swift
//  GablestoneIOS
//
//  Created by AngelikaDW on 20/04/2018.
//  Copyright © 2018 aleaf. All rights reserved.
//

import UIKit
import RealmSwift
import CoreLocation

class DetailViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var stoneImage: UIImageView!
    @IBOutlet weak var stoneNameLabel: UILabel!
    @IBOutlet weak var stoneAddressLabel: UILabel!
    @IBOutlet weak var stoneDescriptionLabel: UILabel!
    
    let realm = try! Realm()
    
    var selectedStone: Stone?
    var tourNumber: Int?
    
    let locationManager = CLLocationManager()
    var userLocation : CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        //Dynamic size of label
        stoneDescriptionLabel.sizeToFit()
        
        //Set up location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Set the title in the nav bar
        title = selectedStone?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func foundButtonPressed(_ sender: UIButton) {
    }
    
    
    func updateUI() {
        stoneNameLabel.text = selectedStone?.name
        stoneAddressLabel.text = selectedStone?.address
        stoneDescriptionLabel.text = selectedStone?.descriptionLong
        stoneImage.image = UIImage(named: "img\(tourNumber!)_\((selectedStone?.runningNumber)!)")
    }
    
    //MARK: - Location Manager Delegate Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            
            print ("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            userLocation = location
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    @IBAction func foundStonePressed(_ sender: UIButton) {
        var stoneLocation = CLLocation(latitude: 52.3703, longitude: 4.895)
        //distance between user and stone in meters
        var distance = userLocation!.distance(from: stoneLocation)
        print(distance)
        if distance < 25 {
            //give feedback to user pop up
            let alert = UIAlertController(title: "Congratulations!", message: "You have found the gablestone", preferredStyle: .alert)
            present(alert, animated: true, completion: nil)
            //write in realm data base match true
        } else {
            let alert = UIAlertController(title: "Gablestone", message: "Not there yet - keep on searching", preferredStyle: .alert)
            present(alert, animated: true, completion: nil)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

