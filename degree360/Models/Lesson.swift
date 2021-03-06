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
    var topics : [Topic]
    var friends : [User]
    var percent : Float

    init() {
        self.id = ""
        self.title = ""
        self.description = ""
        self.author = User()
        self.created = Date()
        self.updated = Date()
        self.topics = [Topic]()
        self.friends = [User]()
        self.percent = 0
    }
    
    init(_ json : JSON) {
        self.id = json["id"].stringValue
        self.title = json["title"].stringValue
        self.description = json["description"].stringValue
        self.author = User(json["author"])
        self.created = json["created"].stringValue.date
        self.updated = json["updated"].stringValue.date
        self.topics = json["topics"].arrayValue.map({ return Topic($0) })
        self.friends = json["friends"].arrayValue.map({ return User($0["user"]) })
        self.percent = json["percent"].floatValue
    }
    
}
