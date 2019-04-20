//
//  File.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import SwiftyJSON

struct Topic {
    var id : String
    var title : String
    var created : Date
    var updated : Date
    
    init() {
        self.id = ""
        self.title = ""
        self.created = Date()
        self.updated = Date()
    }
    
    init(_ json : JSON) {
        self.id = json["id"].stringValue
        self.title = json["title"].stringValue
        self.created = json["created"].stringValue.date
        self.updated = json["updated"].stringValue.date
    }
    
}
