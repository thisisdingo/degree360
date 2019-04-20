//
//  LessonCreateVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

class LessonCreateVC : UIViewController, LessonCreateInteractorProtocol {
    func showMessage(_ message: String) {
        
    }
    
    func startLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    static func getVC() -> LessonCreateVC{
        return LessonCreateVC.init(nibName: "LessonCreateVC", bundle: nil)
    }
    
}
