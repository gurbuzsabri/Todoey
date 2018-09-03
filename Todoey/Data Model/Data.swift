//
//  Data.swift
//  Todoey
//
//  Created by Sabri Gurbuz on 9/2/18.
//  Copyright © 2018 Sabri Gurbuz. All rights reserved.
//

import Foundation
import RealmSwift

class Data : Object {
    @objc dynamic var name : String = ""
    @objc dynamic var age : Int = 0
}
