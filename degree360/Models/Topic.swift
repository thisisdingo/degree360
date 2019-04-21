//
//  File.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import SwiftyJSON

struct RateStruct {
    var value : Int
    var userId : String
    var raterId : String
    
    init(_ json : JSON) {
        self.value = json["value"].intValue
        self.userId = json["friend_id"].stringValue
        self.raterId = json["rater_id"].stringValue
    }
}

struct Topic {
    var id : String
    var title : String
    var rates : [RateStruct]
    
    init() {
        self.id = ""
        self.title = ""
        self.rates = [RateStruct]()
    }
    
    init(_ json : JSON) {
        self.id = json["id"].stringValue
        self.title = json["title"].stringValue
        self.rates = json["rates"].arrayValue.map({ return RateStruct($0) })
    }
    
}
