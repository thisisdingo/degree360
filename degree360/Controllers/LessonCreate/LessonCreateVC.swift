//
//  LessonCreateVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

class LessonCreateVC : UIViewController, LessonCreateInteractorProtocol {
    func successCreate() {
        
    }
    
    var interactor : LessonCreateInteractor!
    
    func successCreate(_ lesson: Lesson) {
        
    }
    
    
    func showMessage(_ message: String) {
        
    }
    
    func startLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    override func viewDidLoad() {
        self.interactor = LessonCreateInteractor(self)
        
        initViews()
    }
    
    func initViews(){
        
        
    }
    
    
    static func getVC() -> LessonCreateVC{
        return LessonCreateVC.init(nibName: "LessonCreateVC", bundle: nil)
    }
    
}
