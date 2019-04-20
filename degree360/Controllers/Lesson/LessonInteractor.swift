//
//  LessonInteractor.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import Foundation

protocol LessonInteractorProtocol : BaseInteractorProtocol{
    func success()
}

class LessonInteractor : BaseInteractor {
    
    
    init(_ delegate : LessonInteractorProtocol){
        super.init()
        
        self.delegate = delegate
    }
    
//    func register(_ name: String, _ photo: UIImage){
//        
//    }
}
