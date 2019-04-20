//
//  ViewController.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        let isAuth = UserController.shared.isAuth
        
        if(isAuth){
            let vc = RegisterVC.getVC()
            present(vc, animated: true, completion: nil)
        }else{
            let vc = Helpers.getNavController(LessonVC.getVC())
            present(vc, animated: true, completion: nil)
        }
        
    }

}

