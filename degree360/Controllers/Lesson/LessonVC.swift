//
//  LessonVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

class LessonVC : UIViewController, LessonInteractorProtocol {
    
    func showLessons(_ lessons: [Lesson]) {
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func showMessage(_ message: String) {
        
    }
    
    func startLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    
    var interactor : LessonInteractor!
    
    override func viewDidLoad() {
        self.interactor = LessonInteractor(self)
        
        initViews()
    }
    
    static func getVC() -> LessonVC{
        return LessonVC.init(nibName: "LessonVC", bundle: nil)
    }
    
    func initViews(){
        
        let createBtn = UIBarButtonItem(title: "NEW", style: .done, target: self, action: #selector(self.addButtonTapped(_:)))
        self.navigationItem.rightBarButtonItem = createBtn
        
    }
    
    @objc func addButtonTapped(_ sender : UIBarButtonItem){
        let vc = Helpers.getNavController(LessonCreateVC.getVC())
        present(vc, animated: true, completion: nil)
    }
    
}
