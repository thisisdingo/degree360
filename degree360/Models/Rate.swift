//
//  Rate.swift
//  degree360
//
//  Created by Ayaal Kaplin on 21/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Rate {
    var id : String
    var topic_id : String
    var frient_id : String
    var rater_id : String
    var value : String
    
    init() {
        self.id = ""
        self.topic_id = ""
        self.frient_id = ""
        self.rater_id = ""
        self.value = ""
    }
    
    init(_ json : JSON) {
        self.id = json["id"].stringValue
        self.topic_id = json["topic_id"].stringValue
        self.frient_id = json["frient_id"].stringValue
        self.rater_id = json["rater_id"].stringValue
        self.value = json["value"].stringValue
    }
    
}
