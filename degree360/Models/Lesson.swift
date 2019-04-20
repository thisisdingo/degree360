//
//  Lesson.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Lesson {
    var id : String
    var title : String
    var description : String
    var author : User
    var created : Date
    var updated : Date
    
    init(_ json : JSON) {
        self.id = json["id"].stringValue
        self.title = json["title"].stringValue
        self.description = json["description"].stringValue
        self.author = User(json["author"])
        self.created = json["created"].stringValue.date
        self.updated = json["updated"].stringValue.date
    }
    
}
