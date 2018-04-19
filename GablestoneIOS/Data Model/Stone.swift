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
    @objc dynamic var address: String = ""
    @objc dynamic var housenumber: Int = 0
    @objc dynamic var runningNumber: Int = 0
    @objc dynamic var descriptionLong: String = ""
    
    var parentTour = LinkingObjects(fromType: Tour.self, property: "stones")
    
}
