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
    
    func showMessage(_ message: String) {
        
    }
    
    func startLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    
    var interactor : RegisterInteractor!
    
    override func viewDidLoad() {
        self.interactor = RegisterInteractor(self)
    }
    
    static func getVC() -> LessonVC{
        return LessonVC.init(nibName: "LessonVC", bundle: nil)
    }
}
