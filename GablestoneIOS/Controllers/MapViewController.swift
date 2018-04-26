//
//  MapViewController.swift
//  GablestoneIOS
//
//  Created by AngelikaDW on 24/04/2018.
//  Copyright © 2018 aleaf. All rights reserved.
//

import UIKit
import GoogleMaps
import RealmSwift

class MapViewController: UIViewController {
    var realm: Realm!
    var stones: Results<Stone>?
    var selectedTourNumber: Int?
    var selectedStone: Stone?
    var selectedTour: Tour? {
        didSet{
            loadStones()
        }
    }
     
    
    override func loadView() {
        // Create a GMSCameraPosition
        let stone = stones![3]
        let camera = GMSCameraPosition.camera(withLatitude: stone.latitude, longitude: stone.longitude, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        //Add markers
        for stone in stones! {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: stone.latitude, longitude: stone.longitude)
            marker.title = String(stone.runningNumber) + " " + stone.name
            marker.snippet = stone.address
            marker.map = mapView
            marker.icon = stone.match ? GMSMarker.markerImage(with: .green) : GMSMarker.markerImage(with: .blue)
        }
        //MyLocationButton
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        //TODO: get google directions
        
        //open infowindow of stone clicked
        let locationMarker = GMSMarker()
        locationMarker.position = CLLocationCoordinate2D(latitude: (selectedStone?.latitude)!, longitude: (selectedStone?.longitude)!)
        locationMarker.map = mapView
        mapView.selectedMarker = locationMarker
        locationMarker.appearAnimation = .pop
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapVC selectedTour: \(selectedTourNumber ?? 0)")
            realm = try! Realm()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Set the title in the nav bar
       // title = selectedTour?.tourName
    }
    
    // MARK - Model Manipulation Method
    func loadStones(){
        stones = selectedTour?.stones.sorted(byKeyPath: "runningNumber", ascending: true)
    }


    
    // MARK: - Navigation
    
    func addMarkers() {
        
        
    }

}
