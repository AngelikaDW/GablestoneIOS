//
//  DetailViewController.swift
//  GablestoneIOS
//
//  Created by AngelikaDW on 20/04/2018.
//  Copyright © 2018 aleaf. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController{
    
    @IBOutlet weak var stoneImage: UIImageView!
    @IBOutlet weak var stoneNameLabel: UILabel!
    @IBOutlet weak var stoneAddressLabel: UILabel!
    @IBOutlet weak var stoneDescriptionLabel: UILabel!
    
    let realm = try! Realm()
    
    var selectedStone: Stone?
    var tourNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //stoneNameLabel.text = selectedStone?.name
        updateUI()
        stoneDescriptionLabel.sizeToFit()
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
