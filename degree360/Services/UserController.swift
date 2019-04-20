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
        return defaults.string(forKey: "userId") != nil
    }
    
    var userId : Int {
        set (value) {
            defaults.set(value, forKey: "userId")
            defaults.synchronize()
        }
        get {
            return Int(defaults.string(forKey: "userId") ?? "") ?? 0
        }
    }
    
    
}