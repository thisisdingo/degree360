//
//  Helpers.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit
import Hero

class Helpers {
    
    static func getNavController(_ rootVC : UIViewController) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootVC)        
        navController.hero.isEnabled = true
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
    
}
