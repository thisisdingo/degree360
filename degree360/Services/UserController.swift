//
//  UserController.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import Foundation

class UserController {
    
    static var shared : UserController = UserController.init()
    
    let defaults = UserDefaults.standard
    
    var isAuth : Bool {
        return !userId.isEmpty
    }
    
    var userId : String {
        set (value) {
            defaults.set(value, forKey: "userId")
            defaults.synchronize()
        }
        get {
            return defaults.string(forKey: "userId") ?? ""
        }
    }
    
    func dropUserData(){
        userId = ""
    }
    
}
