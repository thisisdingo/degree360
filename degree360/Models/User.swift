//
//  User.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    var id : String
    var name : String
    var avatar : String
    var rates = [Rate]()
    
    init() {
        self.id = ""
        self.name = ""
        self.avatar = ""
    }
    
    init(_ json : JSON) {
        self.id = json["id"].stringValue
        self.name = json["name"].stringValue
        self.avatar = json["avatar"].stringValue
        self.rates = json["rates"].arrayValue.map({ Rate($0) })
    }
    
}
