//
//  Extenstion+SwiftyJSON.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import SwiftyJSON

extension JSON {
    
    var hasError : Bool {
        return !self["error"].stringValue.isEmpty
    }
    
    var errorMessage : String {
        return self["error"].stringValue
    }
    
}
