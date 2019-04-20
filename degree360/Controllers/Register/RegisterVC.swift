//
//  RegisterVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

class RegisterVC : UIViewController, RegisterInteractorProtocol {
    func showMessage(_ message: String) {
        
    }
    
    func startLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func successRegister() {
        
    }
    
    var interactor : RegisterInteractor!
    
    override func viewDidLoad() {
        self.interactor = RegisterInteractor(self)
        
        // on click
        // validate
        //self.interactor.register(<#T##name: String##String#>, <#T##photo: UIImage##UIImage#>)
    }
    
}
