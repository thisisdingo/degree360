//
//  API.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import SwiftyJSON
import UIKit

typealias callback = (_ json : JSON?, _ error : String?) -> Void

class API {
    
    func toJSON(_ dic : [String : Any]) -> Data {
        return try! JSONSerialization.data(withJSONObject: dic, options: [.sortedKeys])
    }
    
    func uploadImage(_ image : UIImage, _ c : @escaping callback){
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            c(nil, "Не удалось сконвертировать изображение в JPG")
            return
        }
        
        let data = ["image" : imageData.base64EncodedString(),
                    "uid" : UserController.shared.userId] as [String : Any]
        
        
        
        
    }
    
    func createUser(_ name : String){
        
        
        
        
    }
    
}
