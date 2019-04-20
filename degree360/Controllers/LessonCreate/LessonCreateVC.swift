//
//  LessonCreateVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

class LessonCreateVC : UIViewController, LessonCreateInteractorProtocol {
    
    @IBOutlet weak var lessonTitle: UITextField!
    @IBOutlet weak var lessonDescription: UITextField!
    
    @IBAction func createBtn(_ sender: UIButton) {
        interactor.createLesson(lessonTitle.text!, lessonDescription.text!, ["topic1", "topic2", "Topic3"])
    }
    
    func successCreate() {
        
    }
    
    var interactor : LessonCreateInteractor!
    
    func successCreate(_ lesson: Lesson) {
        self.navigationController?.popToRootViewController(animated: true)
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
