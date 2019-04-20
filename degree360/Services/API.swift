//
//  API.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import SwiftyJSON
import UIKit

typealias callback = (_ json : JSON) -> Void

class API {
    
    func toJSON(_ dic : [String : Any]) -> Data {
        return try! JSONSerialization.data(withJSONObject: dic, options: [.sortedKeys])
    }
    
    func uploadImage(_ image : UIImage){
        
        let data = ["image" : image.jpegData(compressionQuality: 0.5)]
        
        
        
        
    }
    
}
