//
//  RegisterInteractor.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

protocol RegisterInteractorProtocol : BaseInteractorProtocol {
    func successRegister()
}

class RegisterInteractor : BaseInteractor {
    
    
    init(_ delegate : BaseInteractorProtocol){
        super.init()

        self.delegate = delegate
    }
    
    func register(_ name: String, _ photo: UIImage){
        
    }
}
