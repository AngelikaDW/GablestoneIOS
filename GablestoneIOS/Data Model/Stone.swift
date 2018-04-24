//
//  Stone.swift
//  GablestoneIOS
//
//  Created by AngelikaDW on 19/04/2018.
//  Copyright © 2018 aleaf. All rights reserved.
//

import Foundation
import RealmSwift

class Stone: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var nameDE: String = ""
    @objc dynamic var nameNL: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var runningNumber: Int = 0
    @objc dynamic var descriptionLong: String = ""
    @objc dynamic var descriptionDE: String = ""
    @objc dynamic var descriptionNL: String = ""
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var longitude: Double = 0.0
    @objc dynamic var match: Bool = false
    
    
    var parentTour = LinkingObjects(fromType: Tour.self, property: "stones")
    
}
