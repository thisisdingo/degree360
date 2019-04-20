//
//  RegisterVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

class RegisterVC : UIViewController, RegisterInteractorProtocol {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UITextField!
    
    @IBAction func checkMale(_ sender: UIButton) {
        photo.image = #imageLiteral(resourceName: "male")
    }
    
    @IBAction func checkFemale(_ sender: Any) {
        photo.image = #imageLiteral(resourceName: "female")
    }
    
    @IBAction func clickRegister(_ sender: Any) {
        
        guard let userName = name.text else {
            alert("Please type your name");
            return
        }
        
        guard let image = photo.image else {
            alert("Please type your name");
            return
        }
        
        self.interactor.register(userName, image)
    }
    
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
    
    static func getVC() -> RegisterVC{
        return RegisterVC.init(nibName: "RegisterVC", bundle: nil)
    }
    
}
