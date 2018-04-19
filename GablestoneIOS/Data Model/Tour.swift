//
//  File.swift
//  GablestoneIOS
//
//  Created by AngelikaDW on 19/04/2018.
//  Copyright © 2018 aleaf. All rights reserved.
//

import Foundation
import RealmSwift

class Tour: Object {
    @objc dynamic var tourName: String = ""
    @objc dynamic var tourNumber: Int = 0
    
    let stones = List<Stone>()
    
}
