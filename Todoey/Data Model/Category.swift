//
//  Category.swift
//  Todoey
//
//  Created by Sabri Gurbuz on 9/2/18.
//  Copyright © 2018 Sabri Gurbuz. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name : String = ""
    let items = List<Item>() //List comes from Realm
}
