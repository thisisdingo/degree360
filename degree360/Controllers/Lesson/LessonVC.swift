//
//  LessonVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

class LessonVC : UIViewController, LessonInteractorProtocol {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    func success() {
        
    }
    
    func showMessage(_ message: String) {
        
    }
    
    func startLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    
    var interactor : RegisterInteractor!
    
    override func viewDidLoad() {
        self.interactor = RegisterInteractor(self as! RegisterInteractorProtocol)
        
        initViews()
    }
    
    static func getVC() -> LessonVC{
        return LessonVC.init(nibName: "LessonVC", bundle: nil)
    }
    
    func initViews(){
        
        let createBtn = UIBarButtonItem(title: "SS", style: .done, target: self, action: #selector(self.addButtonTapped(_:)))
        self.navigationItem.rightBarButtonItem = createBtn
        
    }
    
    @objc func addButtonTapped(_ sender : UIBarButtonItem){
        let vc = Helpers.getNavController(LessonCreateVC.getVC())
        present(vc, animated: true, completion: nil)
    }
    
}
