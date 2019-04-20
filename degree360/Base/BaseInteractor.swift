//
//  BaseInteractor.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import Foundation

protocol BaseInteractorProtocol : class {
    
    func showMessage(_ message : String)
    func startLoading()
    func hideLoading()
    
}

class BaseInteractor {
    
    weak var delegate : BaseInteractorProtocol?
    
    
    
}
